import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/model/task_model.dart';
import 'package:kanban/widget/progress_bar.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;

  const TaskCard({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppStyle.taskBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskModel.title,
              style: AppStyle.taskTitleTextStyle,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: taskModel.progress.length,
                itemBuilder: (context, index) {
                  log("task model: ${taskModel.progress}");
                  return ProgressBar.fromProgress(
                    typeColor: AppStyle.typeColors[index],
                    progress: taskModel.progress[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
