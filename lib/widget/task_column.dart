import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/core/app_style.dart';
import 'package:kanban/model/task_card/task_card_model.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:kanban/widget/task_card.dart';

import '../const/app_const.dart';
import '../controller/board_controller.dart';

class TaskColumn extends StatefulWidget {
  final List<TaskModel> tasks;
  final int correspondingStage;
  final bool columnBackground;
  final Function swapTasksHandler;
  final void Function()? dragTaskHandler;

  const TaskColumn({
    Key? key,
    required this.correspondingStage,
    required this.tasks,
    required this.swapTasksHandler,
    this.columnBackground = true,
    this.dragTaskHandler,
  }) : super(key: key);

  @override
  State<TaskColumn> createState() => _TaskColumnState();
}

class _TaskColumnState extends State<TaskColumn> {
  BoardController boardController = Get.find<BoardController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: DragTarget<TaskCardModel>(
        onWillAccept: (TaskCardModel? task) {
          if (task == null) return false;
          if (task.stage == null) return false;
          // if ((task.blockerRemaining ?? 0) > 0) return false;
          return boardController.shouldAllowMove(
            taskProgress: task.progress!,
            taskStage: task.stage!,
            toStage: widget.correspondingStage,
          );
        },
        onAccept: (TaskCardModel task) {
          boardController.moveTask(taskId: task.id!, toStage: AppConst.stageIMapping[widget.correspondingStage]!);
        },
        builder: (BuildContext context, List<Object?> candidateData, List rejectedData) => Container(
          decoration: BoxDecoration(
            color: widget.columnBackground ? AppStyle.columnBgColor : Colors.transparent,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            border: Border.all(color: AppStyle.columnBgColor),
          ),
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: widget.tasks.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              Widget taskCardWidget = TaskCard(
                taskModel: widget.tasks[index],
              );
              return Draggable<TaskCardModel>(
                // delay: Duration(seconds: 2), // for mobile use longdraggable
                onDragStarted: widget.dragTaskHandler,
                data: TaskCardModel.fromTaskModel(widget.tasks[index], index),
                child: DragTarget<TaskCardModel>(
                  builder: (BuildContext context, List<Object?> candidateData, List rejectedData) {
                    return taskCardWidget;
                  },
                  onWillAccept: (TaskCardModel? task) {
                    // todo logic validation SWAP
                    if (task == null) return false;
                    if (task.stage == null) return false;
                    // if ((task.blockerRemaining ?? 0) > 0) return false;
                    // final toStage = widget.tasks[index].stage!;
                    // if stages not correspond
                    // if (task.stage! - 1) % 3 != toStage - 1) % 3) return false;
                    return true;
                  },
                  onAccept: (TaskCardModel task) {
                    print("accepted $task");
                    widget.swapTasksHandler(task, TaskCardModel.fromTaskModel(widget.tasks[index], index));
                  },
                ),
                childWhenDragging: TaskCard(
                  taskModel: widget.tasks[index],
                  isGhost: true,
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
