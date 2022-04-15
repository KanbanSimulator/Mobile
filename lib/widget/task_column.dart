import 'package:flutter/material.dart';
import 'package:kanban/model/task_card/task_card_model.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:kanban/widget/task_card.dart';

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
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff151515),
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            Widget taskCardWidget;
            taskCardWidget = TaskCard(
              taskModel: tasks[index],
            );
            return Draggable<TaskCardModel>(
              // delay: Duration(seconds: 2), // for mobile use longdraggable
              data: TaskCardModel.fromTaskModel(tasks[index]),

              child: DragTarget<TaskCardModel>(
                builder: (BuildContext context, List<Object?> candidateData,
                    List rejectedData) {
                  return taskCardWidget;
                },
                onWillAccept: (TaskCardModel? task) {
                  if (task == null) return false;
                  return true;
                  // return (task.stage == tasks[index].stage);
                },
                onAccept: (TaskCardModel task) {
                  print("accepted $task");
                },
              ),

              childWhenDragging: TaskCard(
                taskModel: tasks[index],
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
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 4,
            );
          },
        ),
      ),
    );
  }
}