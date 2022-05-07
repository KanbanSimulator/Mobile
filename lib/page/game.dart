import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanban/core/app_style.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/people_bank.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_table.dart';

import '../const/app_const.dart';
import '../const/app_res.dart';
import '../model/task/task_model.dart';
import '../widget/logo.dart';

class GamePage extends StatefulWidget {
  final int teamId;
  final int roomId;
  final List<TaskModel> tasks;

  const GamePage({
    Key? key,
    required this.teamId,
    required this.roomId,
    required this.tasks,
  }) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Timer _timer; // timer for LP
  late List<TaskModel> _tasks;

  @override
  void initState() {
    _tasks = widget.tasks;
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
                    child: Row(
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
                                  onPressed: () => _onBacklogPressed(context),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                PeopleBank(count: 3, stage: 0),
                                PeopleBank(count: 3, stage: 1),
                                PeopleBank(count: 3, stage: 2),
                              ],
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
                          tasksRaw: _tasks,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        endDrawer: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
            child: Container(
              width: 500,
              decoration: const BoxDecoration(
                color: AppStyle.backlogBackgroundColor,
              ),
              child: Drawer(
                backgroundColor: Colors.transparent,
                child: ListView.builder(
                  itemBuilder: (context, index) => Text("$index"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onBacklogPressed(context) {
    print("backlog show");
    Scaffold.of(context).openEndDrawer();
  }

  _onCompleteDayPressed() {
    print("complete day");
  }

  void _startLongPolling() {
    if (mounted) {
      setState(() {
        _timer = Timer.periodic(const Duration(milliseconds: AppConst.gameUpdateFrequency), (timer) async {
          print("getting tasks...");
          List<TaskModel> tasksFromServer = await BoardApi.getTasks(widget.teamId);
          setState(() {
            _tasks = [...tasksFromServer];
          });
        });
      });
    }
  }

  void _stopLongPolling() {
    if (mounted) {
      setState(() {
        _timer.cancel();
      });
    }
  }
}
