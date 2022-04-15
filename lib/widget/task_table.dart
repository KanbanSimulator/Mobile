import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kanban/core/api/api.dart';
import 'package:kanban/model/task_model.dart';
import 'package:kanban/page/error.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_column.dart';

class TaskTable extends StatelessWidget {
  final int day;

  const TaskTable({
    Key? key,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api.getTasks(day),
      builder: (context, AsyncSnapshot<List<TaskModel>> snapshot) {
        if (!snapshot.hasData) return ErrorPage(text: "No data for day $day");
        List<TaskModel> tasks = snapshot.data!;
        if (tasks.isEmpty) {
          return ErrorPage(text: "No tasks for day $day");
        }

        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: TaskColumn(
                tasks: tasks.where((e) => e.stage == 0).toList(),
              ),
            ),
            Expanded(
              child: TaskColumn(
                tasks: tasks.where((e) => e.stage == 3).toList(),
              ),
            ),
            Expanded(
              child: TaskColumn(
                tasks: tasks.where((e) => e.stage == 1).toList(),
              ),
            ),
            Expanded(
              child: TaskColumn(
                tasks: tasks.where((e) => e.stage == 4).toList(),
              ),
            ),
            Expanded(
              child: TaskColumn(
                tasks: tasks.where((e) => e.stage == 2).toList(),
              ),
            ),
            Expanded(
              child: TaskColumn(
                tasks: tasks.where((e) => e.stage == 5).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
