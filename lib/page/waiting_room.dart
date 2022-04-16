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

class WaitingRoomPage extends StatefulWidget {
  final RoomModel roomModel;

  const WaitingRoomPage({
    Key? key,
    required this.roomModel,
  }) : super(key: key);

  @override
  State<WaitingRoomPage> createState() => _WaitingRoomPageState();
}

class _WaitingRoomPageState extends State<WaitingRoomPage> {
  late int _playerId; // pulled from cache
  late RoomModel roomState; // passed from prev page

  @override
  void initState() {
    roomState = widget.roomModel;
    initCachedFields();
    initLongPolling();
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
                    "Room ID: ${roomState.id}",
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
                      "Waiting room",
                      style: AppStyle.pageHeaderTextStyle,
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      "Connected players:",
                      textAlign: TextAlign.start,
                      style: AppStyle.textFieldStyle,
                    ),
                    const SizedBox(height: 16),
                    for (var player in roomState.players!)
                      SizedBox(
                        width: 200,
                        height: 24,
                        child: Text(
                          player.name!,
                          textAlign: TextAlign.start,
                          style: AppStyle.labelTextStyle,
                        ),
                      ),
                    const SizedBox(height: 32),
                    if (roomState.player!.creator!)
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
  }

  void initLongPolling() {
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      RoomModel? roomFromServer = await Api.checkRoom(_playerId, roomState.id!);
      if (roomFromServer != null) {
        setState(() {
          roomState = roomFromServer;
        });
        print("LP: players list from server: ${roomState.players}");
      } else {
        print("something went wrong: this room is null!");
      }
    });
  }

  void initCachedFields() async {
    _playerId = await CacheService.getUserId();
  }
}
