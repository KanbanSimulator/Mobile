import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/core/app_style.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/people_bank.dart';
import 'package:kanban/widget/task_table.dart';

import '../const/app_const.dart';
import '../const/app_res.dart';
import '../controller/board_controller.dart';
import '../controller/lp_controller.dart';
import '../controller/room_controller.dart';
import '../model/task/task_model.dart';
import '../widget/logo.dart';

class GamePage extends StatefulWidget {
  final int teamId;
  final int roomId;

  const GamePage({
    Key? key,
    required this.teamId,
    required this.roomId,
  }) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  RoomController roomController = Get.find<RoomController>();
  LPController lp = LPController();
  BoardController boardController = Get.find<BoardController>();

  @override
  void initState() {
    _startLongPolling();
    super.initState();
  }

  void _startLongPolling() {
    lp.start(
      duration: const Duration(seconds: AppConst.gameUpdateFrequency),
      worker: (timer) async {
        boardController.fetchTasks();
        boardController.fetchBoard();
        setState(() {});
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.backgroundColor,
        body: Builder(
          builder: (context) => Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: 64,
                  decoration: const BoxDecoration(color: AppStyle.columnBgColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 48,
                              height: 48,
                              child: Logo(),
                            ),
                            const SizedBox(width: 48),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Room #${widget.roomId}",
                                  style: AppStyle.taskTitleTextStyle.copyWith(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Team #${widget.teamId}",
                                  style: AppStyle.taskTitleTextStyle.copyWith(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 140,
                                    height: 48,
                                    child: AppButton(
                                      "Backlog",
                                      leading: const Icon(
                                        Icons.my_library_books_rounded,
                                        color: AppStyle.iconColor,
                                      ),
                                      onPressed: () => boardController.switchBacklog(),
                                    ),
                                  ),
                                  const SizedBox(width: 48),
                                  SizedBox(
                                    width: 200,
                                    height: 48,
                                    child: AppButton(
                                      "Complete this day",
                                      leading: const Icon(
                                        Icons.done_outline_rounded,
                                        color: AppStyle.iconColor,
                                      ),
                                      onPressed: _onCompleteDayPressed,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            "Day ${boardController.board.value.day ?? -1}",
                            style: AppStyle.taskTitleTextStyle.copyWith(
                              color: Colors.white70,
                              fontSize: 16,
                              letterSpacing: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(height: 24),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  PeopleBank(count: boardController.board.value.analyticsPeopleBank ?? 3, stage: 0),
                                  PeopleBank(count: boardController.board.value.developmentPeopleBank ?? 3, stage: 1),
                                  PeopleBank(count: boardController.board.value.testingPeopleBank ?? 3, stage: 2),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(AppRes.stageTitle[0], style: AppStyle.stageTitleTextStyle),
                                Text(AppRes.stageTitle[1], style: AppStyle.stageTitleTextStyle),
                                Text(AppRes.stageTitle[2], style: AppStyle.stageTitleTextStyle),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(AppRes.inProgress, style: AppStyle.stageSubTitleTextStyle),
                                Text(AppRes.finished, style: AppStyle.stageSubTitleTextStyle),
                                Text(AppRes.inProgress, style: AppStyle.stageSubTitleTextStyle),
                                Text(AppRes.finished, style: AppStyle.stageSubTitleTextStyle),
                                Text(AppRes.inProgress, style: AppStyle.stageSubTitleTextStyle),
                                Text(AppRes.finished, style: AppStyle.stageSubTitleTextStyle),
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TaskTable(
                          tasksRaw: boardController.tasks,
                          // isBacklogOpen: ValueNotifier(boardController.isBacklogOpen),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onCompleteDayPressed() {
    print("complete day");
  }
}
