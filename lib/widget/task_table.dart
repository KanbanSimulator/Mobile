import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:kanban/model/task_card/task_card_model.dart';
import 'package:kanban/page/error.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_column.dart';

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
  final Map<int, int> _stageMapping = {0: 0, 1: 2, 2: 4, 3: 1, 4: 3, 5: 5};
  final Map<int, int> _stageIMapping = {0: 0, 2: 1, 4: 2, 1: 3, 3: 4, 5: 5};

  List<List<TaskModel>> _taskTable = [];

  @override
  void initState() {
    _distributeTasksIntoColumns();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tasksRaw.isEmpty) {
      return const ErrorPage(text: "No tasks for this day");
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i < _taskTable.length; i++)
          Expanded(
            child: DragTarget<TaskCardModel>(
              onAccept: (TaskCardModel tCard) {
                print("${tCard.title} accepted for move into this column");
              },
              builder: (dragContext, candidateData, rejectedData) => TaskColumn(
                correspondingStage: i,
                tasks: _taskTable[i],
                swapTasks: _onSwapTasks,
                moveTasks: _onMoveTasks,
              ),
            ),
          ),
      ],
    );
  }

  _onSwapTasks(TaskCardModel t1, TaskCardModel t2) {
    final int c1 = _stageMapping[t1.stage!]!;
    final int c2 = _stageMapping[t2.stage!]!;
    final int r1 = t1.inColumnIndex!;
    final int r2 = t2.inColumnIndex!;
    print("swapping r$r1;c$c1 and r$r2;c$c2");
    if (mounted) {
      setState(() {
        TaskModel taskTemp = _taskTable[c1][r1].copyWith();
        _taskTable[c1][r1] = _taskTable[c2][r2].copyWith(stage: _stageIMapping[c1]);
        _taskTable[c2][r2] = taskTemp.copyWith(stage: _stageIMapping[c2]);
      });
    }
  }

  _onMoveTasks(TaskCardModel task, int toStage) {
    print("moving $task to $toStage");
    if (mounted) {
      setState(() {
        int fromStage = _stageMapping[task.stage!]!;
        // find by title in fromStage column
        int taskIndex = _taskTable[fromStage].indexWhere((t) => t.title == TaskModel.fromTaskCardModel(task).title);
        if (taskIndex != -1) {
          print("column $fromStage: ${_taskTable[fromStage]}");
          _taskTable[fromStage].removeAt(taskIndex);
        }
        _taskTable[toStage].add(TaskModel.fromTaskCardModel(task).copyWith(stage: _stageIMapping[toStage]));
      });
    }
  }

  void _distributeTasksIntoColumns() {
    if (_taskTable.isEmpty) {
      _taskTable = [
        widget.tasksRaw.where((e) => e.stage == 0).toList(),
        widget.tasksRaw.where((e) => e.stage == 3).toList(),
        widget.tasksRaw.where((e) => e.stage == 1).toList(),
        widget.tasksRaw.where((e) => e.stage == 4).toList(),
        widget.tasksRaw.where((e) => e.stage == 2).toList(),
        widget.tasksRaw.where((e) => e.stage == 5).toList(),
      ];
      // print(_taskTable[0]);
      // print(_taskTable[1]);
      // print(_taskTable[2]);
      // print(_taskTable[3]);
      // print(_taskTable[4]);
      // print(_taskTable[5]);
    }
  }
}
