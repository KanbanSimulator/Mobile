import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kanban/const/app_const.dart';
import 'package:kanban/const/app_res.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/core/app_ui.dart';
import 'package:kanban/core/cache_service.dart';
import 'package:kanban/model/player/player_model.dart';
import 'package:kanban/model/room/room_model.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/text_input_widget.dart';

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
  late RoomModel _roomState; // passed from prev page
  late Timer _timer; // timer for LP
  late final Map<int, int> teamIdByNumber;

  // late Map<int, List<dynamic>> _playerState; // id -> [teamNumber, spectator]

  @override
  void initState() {
    _roomState = widget.roomModel;
    teamIdByNumber = {};
    // populate mapping team id -> team number
    for (int i = 0; i < _roomState.teams!.length; i++) {
      teamIdByNumber[_roomState.teams![i].teamId!] = _roomState.teams![i].teamNumber!;
    }
    _initCachedFields();
    _startLongPolling();
    super.initState();
  }

  @override
  void dispose() {
    try {
      _stopLongPolling();
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
                      width: MediaQuery.of(context).size.width / 3,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    player.name!,
                                    textAlign: TextAlign.start,
                                    style: AppStyle.labelTextStyle,
                                  ),
                                  const Spacer(),
                                  if (_roomState.player!.creator!)
                                    DropdownButton(
                                        hint: Text(
                                          "${player.teamNumber!}",
                                          style: AppStyle.labelTextStyle,
                                        ),
                                        dropdownColor: AppStyle.taskBackgroundColor,
                                        style: AppStyle.labelTextStyle,
                                        isDense: true,
                                        borderRadius: BorderRadius.circular(25),
                                        items: _roomState.teams!
                                            .map((t) => t.teamNumber)
                                            .map((t) => DropdownMenuItem<int>(child: Text("$t"), value: t))
                                            .toList(),
                                        onChanged: (int? teamNumberSelected) {
                                          setState(() {
                                            int index = (_roomState.players?.indexOf(player))!;
                                            _roomState.players?.removeAt(index);
                                            _roomState.players?.insert(
                                                index,
                                                player.copyWith(
                                                  teamNumber: teamNumberSelected!,
                                                  teamId: teamIdByNumber[teamNumberSelected],
                                                ));
                                          });
                                        }),
                                  if (_roomState.player!.creator!) const SizedBox(width: 32),
                                  if (_roomState.player!.creator!)
                                    const Text("Spectator? ", style: AppStyle.labelTextStyle),
                                  if (_roomState.player!.creator!)
                                    CupertinoSwitch(
                                      value: player.spectator!,
                                      onChanged: (val) {
                                        // because models in freezed are immutable...
                                        setState(() {
                                          // ...we replace element in list through deletion
                                          int index = (_roomState.players?.indexOf(player))!;
                                          _roomState.players?.removeAt(index);
                                          _roomState.players?.insert(index, player.copyWith(spectator: val));
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

  // only available for room owner
  void _onStartGamePressed(BuildContext context) async {
    String username = await CacheService.getUsername();
    if (username == AppConst.unnamed) {
      AppUi.toast(context, AppRes.checkLoggedIn);
      return;
    }
    // start room api request
    RoomModel? roomStarted = await Api.startGame(username, _roomState.id!, _roomState.players!);
    print("data from server room model (start game) : ${roomStarted!.toJson().toString()}");
    // going to the game page
    _continueRoomFlow();
  }

  void _startLongPolling() {
    if (mounted) {
      setState(() {
        _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
          RoomModel? roomFromServer = await Api.checkRoom(_playerId, _roomState.id!);
          if (roomFromServer != null) {
            setState(() {
              // add only newly gotten players
              List<PlayerModel> newPlayers = [];
              List<PlayerModel> serverPlayers = roomFromServer.players!;
              for (var pServer in serverPlayers) {
                int? found = _roomState.players?.indexWhere((PlayerModel p) => p.id! == pServer.id!);
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
            // continue flow if game started
            if (_roomState.started != null && _roomState.started!) {
              _continueRoomFlow();
            }
          } else {
            print("something went wrong: this room is null!");
          }
        });
      });
    }
  }

  void _continueRoomFlow() async {
    print("this player's team id: ${_roomState.player!.teamId}");
    _stopLongPolling();
    // List<TaskModel> tasksFromServer = await Api.getTasks(_roomState.player!.teamId!);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext routeContext) => GamePage(
          teamId: _roomState.player!.teamId!,
          tasks: [],
        ),
      ),
    );
  }

  void _stopLongPolling() {
    if (mounted) {
      setState(() {
        _timer.cancel();
      });
    }
  }

  void _initCachedFields() async {
    _playerId = await CacheService.getUserId();
  }
}
