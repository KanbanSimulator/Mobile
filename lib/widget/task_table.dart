import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:kanban/model/task_card/task_card_model.dart';
import 'package:kanban/page/error.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_column.dart';

class TaskTable extends StatefulWidget {
  final int day;

  const TaskTable({
    Key? key,
    required this.day,
  }) : super(key: key);

  @override
  State<TaskTable> createState() => _TaskTableState();
}

class _TaskTableState extends State<TaskTable> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api.getTasks(widget.day),
      builder: (context, AsyncSnapshot<List<TaskModel>> snapshot) {
        if (!snapshot.hasData) return ErrorPage(text: "No data for day ${widget.day}");
        List<TaskModel> tasksRaw = snapshot.data!;
        if (tasksRaw.isEmpty) {
          return ErrorPage(text: "No tasks for day ${widget.day}");
        }

        List<List<TaskModel>> tasks = [
          tasksRaw.where((e) => e.stage == 0).toList(),
          tasksRaw.where((e) => e.stage == 3).toList(),
          tasksRaw.where((e) => e.stage == 1).toList(),
          tasksRaw.where((e) => e.stage == 4).toList(),
          tasksRaw.where((e) => e.stage == 2).toList(),
          tasksRaw.where((e) => e.stage == 5).toList(),
        ];

        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < tasks.length; i++)
              Expanded(
                child: TaskColumn(
                  tasks: tasks[i],
                  swapTasks: _onSwapTasks,
                ),
              ),
          ],
        );
      },
    );
  }

  _onSwapTasks(TaskCardModel t1, TaskCardModel t2) {
    final c1 = t1.stage;
    final c2 = t2.stage;
    final r1 = t1.inColumnIndex;
    final r2 = t2.inColumnIndex;
    print("swapping r$r1;c$c1 and r$r2;c$c2");
  }
}
