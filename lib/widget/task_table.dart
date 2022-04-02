import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kanban/api/api.dart';
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

        // return Expanded(
        //   child: ListView.builder(
        //     itemCount: tasks!.length,
        //     itemBuilder: (context, index) {
        //       return TaskCard(taskModel: tasks[index]);
        //     },
        //   ),
        // );

        // return Expanded(
        //   child: GridView.count(
        //     physics: const BouncingScrollPhysics(),
        //     crossAxisCount: 3,
        //     mainAxisSpacing: 5,
        //     crossAxisSpacing: 12.5,
        //     children: List.generate(tasks!.length, (index) {
        //       return TaskCard(
        //         taskModel: tasks[index],
        //       );
        //     }),
        //   ),
        // );
      },
    );
  }
}

class TaskColumn extends StatelessWidget {
  final List<TaskModel> tasks;

  const TaskColumn({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final rng = Random();
          Widget taskCardWidget;
          taskCardWidget = TaskCard(
            taskModel: tasks[index],
          );
          return Draggable(
            // delay: Duration(seconds: 2), // for mobile use longdraggable
            child: taskCardWidget,
            childWhenDragging: const Text("widget was here."),
            feedback: Card(
              color: Colors.transparent,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 6 - 16,
                height: 138,
                child: taskCardWidget,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 4,
          );
        },
      ),
    );
  }
}
