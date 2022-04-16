import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kanban/const/app_const.dart';
import 'package:kanban/const/app_res.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/core/api/api.dart';
import 'package:kanban/core/app_ui.dart';
import 'package:kanban/core/cache_service.dart';
import 'package:kanban/model/room/room_model.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/text_input_widget.dart';

import 'game.dart';

class LobbyPage extends StatefulWidget {
  final RoomModel roomModel;

  const LobbyPage({
    Key? key,
    required this.roomModel,
  }) : super(key: key);

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  late int _playerId; // pulled from cache
  late RoomModel _roomState; // passed from prev page
  late Timer _timer; // timer for LP

  @override
  void initState() {
    _roomState = widget.roomModel;
    _initCachedFields();
    _startLongPolling();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "Room ID: ${_roomState.id}",
                    textAlign: TextAlign.end,
                    style: AppStyle.h2,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const Text(
                      "Lobby",
                      style: AppStyle.pageHeaderTextStyle,
                    ),
                    if (_roomState.player!.creator!) const SizedBox(height: 32),
                    if (_roomState.player!.creator!)
                      const Text(
                        "You created this room",
                        textAlign: TextAlign.start,
                        style: AppStyle.textFieldStyle,
                      ),
                    const SizedBox(height: 32),
                    Text(
                      "Connected players (${_roomState.players!.length}):",
                      textAlign: TextAlign.start,
                      style: AppStyle.textFieldStyle,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 3,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          for (var player in _roomState.players!)
                            SizedBox(
                              height: 36,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    player.name!,
                                    textAlign: TextAlign.start,
                                    style: AppStyle.labelTextStyle,
                                  ),
                                  const Spacer(),
                                  const Text("Spectator? ",
                                      style: AppStyle.labelTextStyle),
                                  CupertinoSwitch(
                                    value: true,
                                    onChanged: (val) {},
                                    activeColor: Colors.redAccent,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    if (_roomState.player!.creator!)
                      SizedBox(
                        width: 200,
                        height: 48,
                        child: AppButton(
                          "Start game",
                          onPressed: () => _onStartGamePressed(context),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onStartGamePressed(BuildContext context) async {
    String username = await CacheService.getUsername();
    if (username == AppConst.unnamed) {
      AppUi.toast(context, AppRes.checkLoggedIn);
      return;
    }
    // start room api request
    _stopLongPolling();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext routeContext) => GamePage(),
      ),
    );
  }

  void _startLongPolling() {
    setState(() {
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
        RoomModel? roomFromServer =
            await Api.checkRoom(_playerId, _roomState.id!);
        if (roomFromServer != null) {
          setState(() {
            _roomState = roomFromServer;
          });
          print("LP: players list from server: ${_roomState.players}");
        } else {
          print("something went wrong: this room is null!");
        }
      });
    });
  }

  void _stopLongPolling() {
    setState(() {
      _timer.cancel();
    });
  }

  void _initCachedFields() async {
    _playerId = await CacheService.getUserId();
  }
}
