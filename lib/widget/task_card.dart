import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/model/task_model.dart';
import 'package:kanban/widget/people_bank_mini.dart';
import 'package:kanban/widget/progress_bar.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;

  TaskCard({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  final rng = Random();
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    _count = rng.nextInt(7);
    return Container(
      width: double.infinity,
      height: 122,
      // height: double.infinity,
      decoration: BoxDecoration(
        color: AppStyle.taskBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppStyle.taskBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  taskModel.title,
                  style: AppStyle.taskTitleTextStyle,
                ),
                // const PeopleBankMini(count: 2, stage: 1),
                PeopleBankMini(count: _count, stage: taskModel.stage),
              ],
            ),
            const SizedBox(height: 17),
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                // physics: const BouncingScrollPhysics(),
                itemCount: taskModel.progress.length,
                itemBuilder: (context, index) {
                  return ProgressBar.fromProgress(
                    typeColor: AppStyle.stageColor[index],
                    progress: taskModel.progress[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 7);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
