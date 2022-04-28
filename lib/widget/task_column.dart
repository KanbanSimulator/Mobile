import 'package:flutter/material.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/model/task_card/task_card_model.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:kanban/widget/task_card.dart';

import '../const/app_const.dart';

class TaskColumn extends StatefulWidget {
  final List<TaskModel> tasks;
  final Function swapTasks;
  final Function moveTasks;
  final int correspondingStage;

  const TaskColumn({
    Key? key,
    required this.correspondingStage,
    required this.tasks,
    required this.swapTasks,
    required this.moveTasks,
  }) : super(key: key);

  @override
  State<TaskColumn> createState() => _TaskColumnState();
}

class _TaskColumnState extends State<TaskColumn> {
  bool _childrenNotifierValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: DragTarget<TaskCardModel>(
        onWillAccept: (TaskCardModel? task) {
          // logic on how we move tasks into stages
          if (task == null) return false;
          if (task.stage == null) return false;
          final toStage = AppConst.stageIMapping[widget.correspondingStage]!;
          // if stages not correspond
          if (task.stage! % 3 != toStage % 3) return false;
          print("accept move!");
          return true;
        },
        onAccept: (TaskCardModel task) {
          widget.moveTasks(task, widget.correspondingStage);
          // setState(() {
            // провоцируем изменение в childrenNotifierValue чтобы оно пошло в карточку
            // _childrenNotifierValue = !_childrenNotifierValue;
          // });
        },
        builder: (BuildContext context, List<Object?> candidateData, List rejectedData) => Container(
          decoration: BoxDecoration(
            color: AppStyle.columnBgColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            border: Border.all(color: AppStyle.columnBgColor),
          ),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: widget.tasks.length,
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemBuilder: (context, index) {
              Widget taskCardWidget = TaskCard(
                taskModel: widget.tasks[index],
                notifier: ValueNotifier(_childrenNotifierValue),
              );
              return Draggable<TaskCardModel>(
                // delay: Duration(seconds: 2), // for mobile use longdraggable
                data: TaskCardModel.fromTaskModel(widget.tasks[index], index),
                child: DragTarget<TaskCardModel>(
                  builder: (BuildContext context, List<Object?> candidateData, List rejectedData) {
                    return taskCardWidget;
                  },
                  onWillAccept: (TaskCardModel? task) {
                    // todo logic on how we swap tasks between stages
                    if (task == null) return false;
                    if (task.stage == null) return false;
                    final toStage = widget.tasks[index].stage!;
                    // if stages not correspond
                    if (task.stage! % 3 != toStage % 3) return false;
                    print("accept swap!");
                    return true;
                  },
                  onAccept: (TaskCardModel task) {
                    print("accepted $task");
                    widget.swapTasks(task, TaskCardModel.fromTaskModel(widget.tasks[index], index));
                    setState(() {
                      // провоцируем изменение в childrenNotifierValue чтобы оно пошло в карточку
                      _childrenNotifierValue = !_childrenNotifierValue;
                    });
                  },
                ),
                childWhenDragging: TaskCard(
                  taskModel: widget.tasks[index],
                  isGhost: true,
                  notifier: ValueNotifier(_childrenNotifierValue),
                ),
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
          ),
        ),
      ),
    );
  }
}
