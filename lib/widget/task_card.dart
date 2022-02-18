import 'package:flutter/material.dart';
import 'package:kanban/const/color_scheme.dart';
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
        color: GameColors.taskBackgroundColor,
      ),
      child: Column(
        children: [
          Text(taskModel.title),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ProgressBar(
                typeColor: GameColors.analysisColor,
              ),
              ProgressBar(
                typeColor: GameColors.developmentColor,
              ),
              ProgressBar(
                typeColor: GameColors.testingColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
