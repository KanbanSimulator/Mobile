import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kanban/const/app_const.dart';
import 'package:kanban/const/app_res.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/core/api/api.dart';
import 'package:kanban/core/app_ui.dart';
import 'package:kanban/core/cache_service.dart';
import 'package:kanban/model/player/player_model.dart';
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
  // late Map<int, List<dynamic>> _playerState; // id -> [teamNumber, spectator]

  @override
  void initState() {
    _roomState = widget.roomModel;
    _initCachedFields();
    _startLongPolling();
    super.initState();
  }

  @override
  void dispose() {
    _stopLongPolling();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _teamsDropItems = _roomState.teams!
        .map((t) => "${t.teamNumber}")
        .map((t) => DropdownMenuItem<String>(
              value: t,
              child: Text(
                t,
              ),
            ))
        .toList();

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
                flex: 1,
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
                flex: 6,
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
                                  if (_roomState.player!.creator!)
                                    DropdownButton(
                                        items: _teamsDropItems,
                                        // value: "${player.teamNumber ?? "no team"}",
                                        //   items: _roomState.teams!
                                        //       .map((t) => "${t.teamNumber}")
                                        //       .map(
                                        //         (s) => DropdownMenuItem<String>(
                                        //           child: Text(
                                        //             s,
                                        //             style:
                                        //                 AppStyle.labelTextStyle,
                                        //           ),
                                        //         ),
                                        //       )
                                        //       .toList(),
                                        onChanged: (val) {}),
                                  if (_roomState.player!.creator!)
                                    const SizedBox(width: 32),
                                  if (_roomState.player!.creator!)
                                    const Text("Spectator? ",
                                        style: AppStyle.labelTextStyle),
                                  if (_roomState.player!.creator!)
                                    CupertinoSwitch(
                                      value: player.spectator!,
                                      onChanged: (val) {
                                        // because models in freezed are immutable...
                                        setState(() {
                                          // ...we replace element in list through deletion
                                          int index = (_roomState.players
                                              ?.indexOf(player))!;
                                          _roomState.players?.removeAt(index);
                                          _roomState.players?.insert(index,
                                              player.copyWith(spectator: val));
                                        });
                                        print(player.spectator);
                                      },
                                      activeColor: Colors.redAccent,
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (_roomState.player!.creator!) const SizedBox(height: 32),
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
            // add only newly gotten players
            List<PlayerModel> newPlayers = [];
            List<PlayerModel> serverPlayers = roomFromServer.players!;
            for (var pServer in serverPlayers) {
              int? found = _roomState.players
                  ?.indexWhere((PlayerModel p) => p.id! == pServer.id!);
              if (found == null || found == -1) {
                newPlayers.add(pServer);
              }
            }
            // copy all fields except the players
            _roomState = roomFromServer.copyWith(
              players: [..._roomState.players!, ...newPlayers],
            );
          });
          print("LP: new list of players: ${_roomState.players}");
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
