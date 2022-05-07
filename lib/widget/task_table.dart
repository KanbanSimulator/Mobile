import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:kanban/model/task_card/task_card_model.dart';
import 'package:kanban/page/error.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_column.dart';

import '../const/app_const.dart';

class TaskTable extends StatefulWidget {
  final List<TaskModel> tasksRaw;

  const TaskTable({
    Key? key,
    required this.tasksRaw,
  }) : super(key: key);

  @override
  State<TaskTable> createState() => _TaskTableState();
}

class _TaskTableState extends State<TaskTable> {
  List<List<TaskModel>> _taskTable = [];
  bool _backlogOpened = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tasksRaw.isEmpty) {
      return const ErrorPage(text: "No tasks for this day");
    }

    _distributeTasksIntoColumns();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i < _taskTable.length; i++)
          Expanded(
            child: TaskColumn(
              correspondingStage: i,
              tasks: _taskTable[i],
              swapTasks: _onSwapTasks,
              moveTasks: _onMoveTasks,
            ),
          ),
      ],
    );
  }

  _onSwapTasks(TaskCardModel t1, TaskCardModel t2) {
    final int c1 = AppConst.stageMapping[t1.stage!]!;
    final int c2 = AppConst.stageMapping[t2.stage!]!;
    final int r1 = t1.inColumnIndex!;
    final int r2 = t2.inColumnIndex!;
    print("swapping r$r1;c$c1 and r$r2;c$c2");
    if (mounted) {
      setState(() {
        TaskModel taskTemp = _taskTable[c1][r1].copyWith();
        // _taskTable[c1][r1] = _taskTable[c2][r2].copyWith(stage: AppConst.stageIMapping[c1]);
        // _taskTable[c2][r2] = taskTemp.copyWith(stage: AppConst.stageIMapping[c2]);
      });
      // todo отправлять два запроса на мув
      // BoardApi.moveTask(task.id!, _taskTable[toStage].length - 1, AppConst.stageIMapping[toStage]!);
      // BoardApi.moveTask(task.id!, _taskTable[toStage].length - 1, AppConst.stageIMapping[toStage]!);
    }
  }

  _onMoveTasks(TaskCardModel task, int toStage) {
    if (mounted) {
      setState(() {
        // int fromStage = AppConst.stageMapping[task.stage!]!;
        // find by title in fromStage column
        // int taskIndex = _taskTable[fromStage].indexWhere((t) => t.title == TaskModel.fromTaskCardModel(task).title);
        // if (taskIndex != -1) {
          // _taskTable[fromStage].removeAt(taskIndex);
        // }
        // _taskTable[toStage].add(TaskModel.fromTaskCardModel(task).copyWith(stage: AppConst.stageIMapping[toStage]));
        BoardApi.moveTask(task.id!, _taskTable[toStage].length - 1, AppConst.stageIMapping[toStage]!);
      });
    }
  }

  void _distributeTasksIntoColumns() {
    _taskTable = [
      // widget.tasksRaw.where((e) => e.stage == 7).toList(),
      widget.tasksRaw.where((e) => e.stage == 0).toList(),
      widget.tasksRaw.where((e) => e.stage == 3).toList(),
      widget.tasksRaw.where((e) => e.stage == 1).toList(),
      widget.tasksRaw.where((e) => e.stage == 4).toList(),
      widget.tasksRaw.where((e) => e.stage == 2).toList(),
      widget.tasksRaw.where((e) => e.stage == 5).toList(),
    ];
  }
}
