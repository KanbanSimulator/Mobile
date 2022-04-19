import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:kanban/model/task_card/task_card_model.dart';
import 'package:kanban/page/error.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_column.dart';

class TaskTable extends StatefulWidget {
  final Future<List<TaskModel>> tasksFuture;

  const TaskTable({
    Key? key,
    required this.tasksFuture,
  }) : super(key: key);

  @override
  State<TaskTable> createState() => _TaskTableState();
}

class _TaskTableState extends State<TaskTable> {
  final Map<int, int> _stageMapping = {
    0: 0,
    1: 2,
    2: 4,
    3: 1,
    4: 3,
    5: 5,
  };

  late List<List<TaskModel>> _tasksState;

  @override
  void initState() {
    _tasksState = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.tasksFuture,
      builder: (context, AsyncSnapshot<List<TaskModel>> snapshot) {
        if (!snapshot.hasData) return ErrorPage(text: "No data for this day");
        List<TaskModel> tasksRaw = snapshot.data!;
        if (tasksRaw.isEmpty) {
          return ErrorPage(text: "No tasks for this day");
        }

        if (_tasksState.isEmpty) {
          _tasksState = [
            tasksRaw.where((e) => e.stage == 0).toList(),
            tasksRaw.where((e) => e.stage == 3).toList(),
            tasksRaw.where((e) => e.stage == 1).toList(),
            tasksRaw.where((e) => e.stage == 4).toList(),
            tasksRaw.where((e) => e.stage == 2).toList(),
            tasksRaw.where((e) => e.stage == 5).toList(),
          ];
        }

        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < _tasksState.length; i++)
              Expanded(
                child: TaskColumn(
                  tasks: _tasksState[i],
                  swapTasks: _onSwapTasks,
                ),
              ),
          ],
        );
      },
    );
  }

  _onSwapTasks(TaskCardModel t1, TaskCardModel t2) {
    final int c1 = _stageMapping[t1.stage!]!;
    final int c2 = _stageMapping[t2.stage!]!;
    final int r1 = t1.inColumnIndex!;
    final int r2 = t2.inColumnIndex!;
    print("swapping r$r1;c$c1 and r$r2;c$c2");
    setState(() {
      TaskModel taskTemp = _tasksState[c1][r1].copyWith();
      _tasksState[c1][r1] = _tasksState[c2][r2].copyWith();
      _tasksState[c2][r2] = taskTemp.copyWith();
      // int index = (_tasksState[c1].indexOf(_tasksState[c2][r2]));
      // _tasksState[c1].removeAt(index);
      // _tasksState[c1].insert(index, player.copyWith(spectator: val));
    });
  }
}
