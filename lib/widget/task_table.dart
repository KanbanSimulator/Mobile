import 'package:flutter/material.dart';
import 'package:kanban/api/api_basic.dart';
import 'package:kanban/model/task_model.dart';
import 'package:kanban/page/error.dart';
import 'package:kanban/widget/task_card.dart';

class TaskTable extends StatelessWidget {
  final int day;

  const TaskTable({
    Key? key,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiBasic.getTasks(day),
      builder: (context, AsyncSnapshot<List<TaskModel>> snapshot) {
        if (!snapshot.hasData) {
          return ErrorPage(text: "No data for day $day");
        }
        List<TaskModel>? tasks = snapshot.data;
        if (tasks != null && tasks.isEmpty) {
          return ErrorPage(text: "No tasks for day $day");
        }
        return ListView.builder(
          itemCount: tasks!.length,
          itemBuilder: (context, index) {
            return TaskCard(
              taskModel: tasks[index],
            );
          },
        );
      },
    );
  }
}
