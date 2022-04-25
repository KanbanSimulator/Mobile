import 'package:flutter/material.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/model/task_card/task_card_model.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:kanban/widget/task_card.dart';

class TaskColumn extends StatefulWidget {
  final List<TaskModel> tasks;
  final Function swapTasks;

  const TaskColumn({
    Key? key,
    required this.tasks,
    required this.swapTasks,
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
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff151515),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xff151515)),
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
                  return true;
                  // return (task.stage == tasks[index].stage);
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
    );
  }
}
