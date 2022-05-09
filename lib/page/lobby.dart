import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kanban/const/app_const.dart';
import 'package:kanban/const/app_res.dart';
import 'package:kanban/core/app_style.dart';
import 'package:kanban/core/app_ui.dart';
import 'package:kanban/core/cache_service.dart';
import 'package:kanban/model/player/player_model.dart';
import 'package:kanban/model/room/room_model.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/text_input_widget.dart';

import '../controller/board_controller.dart';
import '../controller/lp_controller.dart';
import '../controller/room_controller.dart';
import '../model/task/task_model.dart';
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

  LPController lp = LPController();
  RoomController roomController = Get.find<RoomController>();
  BoardController boardController = Get.find<BoardController>();

  @override
  void initState() {
    roomController.room.value = widget.roomModel;
    roomController.room.refresh();
    _initCachedFields();
    _startLongPolling();
    super.initState();
  }

  void _initCachedFields() async {
    _playerId = await CacheService.getUserId();
  }

  void _startLongPolling() {
    lp.start(
      duration: const Duration(seconds: AppConst.lobbyUpdateFrequency),
      worker: (timer) async {
        await roomController.fetch(playerId: _playerId);
        if (roomController.getRoom.started != null && roomController.getRoom.started!) {
          // continue flow if game started
          _continueRoomFlow();
        }
      },
    );
  }

  @override
  void dispose() {
    try {
      lp.stop();
    } catch (e) {
      log("stop long polling failed :c");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Obx(() {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      "Room ID: ${roomController.getRoom.id}",
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
                      if (roomController.isOwner) const SizedBox(height: 32),
                      if (roomController.isOwner)
                        const Text(
                          "You created this room",
                          textAlign: TextAlign.start,
                          style: AppStyle.textFieldStyle,
                        ),
                      const SizedBox(height: 32),
                      Text(
                        "Connected players (${roomController.getRoom.players!.length}):",
                        textAlign: TextAlign.start,
                        style: AppStyle.textFieldStyle,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 3,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            for (var player in roomController.getRoom.players!)
                              SizedBox(
                                height: 36,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      player.name!,
                                      textAlign: TextAlign.start,
                                      style: AppStyle.labelTextStyle,
                                    ),
                                    const Spacer(),
                                    if (roomController.isOwner)
                                      DropdownButton(
                                          hint: Text(
                                            "${player.teamNumber!}",
                                            style: AppStyle.labelTextStyle,
                                          ),
                                          dropdownColor: AppStyle.taskBackgroundColor,
                                          style: AppStyle.labelTextStyle,
                                          isDense: true,
                                          borderRadius: BorderRadius.circular(25),
                                          items: roomController.room.value.teams!
                                              .map((t) => t.teamNumber)
                                              .map((t) => DropdownMenuItem<int>(child: Text("$t"), value: t))
                                              .toList(),
                                          onChanged: (int? teamNumberSelected) {
                                            changePlayerTeamNumber(player, teamNumberSelected);
                                          }),
                                    if (roomController.isOwner) const SizedBox(width: 32),
                                    if (roomController.isOwner)
                                      const Text("Spectator? ", style: AppStyle.labelTextStyle),
                                    if (roomController.isOwner)
                                      CupertinoSwitch(
                                        value: player.spectator!,
                                        onChanged: (val) {
                                          changePlayerSpectator(player, val);
                                        },
                                        activeColor: Colors.redAccent,
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (roomController.isOwner) const SizedBox(height: 32),
                      if (roomController.isOwner)
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
            );
          }),
        ),
      ),
    );
  }

  // this starts the game on the server
  // only available for room owner
  void _onStartGamePressed(BuildContext context) async {
    String username = await CacheService.getUsername();
    if (username == AppConst.unnamed) {
      AppUi.toast(context, AppRes.checkLoggedIn);
      return;
    }
    // start game in room on backend
    await roomController.startGame();
    // going to the game page
    _continueRoomFlow();
  }

  // this navigates to GamePage
  void _continueRoomFlow() async {
    lp.stop();
    await boardController.fetchTasks();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext routeContext) => GamePage(
          roomId: roomController.getRoom.id!,
          teamId: roomController.getRoom.player!.teamId!,
          // tasks: boardController.tasks,
        ),
      ),
    );
  }

  void changePlayerTeamNumber(player, teamNumberSelected) {
    roomController.changePlayerTeam(player: player, teamNumberSelected: teamNumberSelected);
  }

  void changePlayerSpectator(player, val) {
    roomController.changePlayerSpectatorMode(player: player, newValue: val);
  }
}
