import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:kanban/model/task_card/task_card_model.dart';
import 'package:kanban/page/error.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_column.dart';

import '../const/app_const.dart';

class TaskTable extends StatefulWidget {
  final List<TaskModel> tasksRaw;
  ValueNotifier<bool> isBacklogOpen;
  final Function movePersonHandler;

  TaskTable({
    Key? key,
    required this.tasksRaw,
    required this.isBacklogOpen,
    required this.movePersonHandler,
  }) : super(key: key);

  @override
  State<TaskTable> createState() => _TaskTableState();
}

class _TaskTableState extends State<TaskTable> {
  List<List<TaskModel>> _taskTable = [];
  bool _lastBacklogOpen = false;
  final GlobalKey<AnimatedListState> _rowKey = GlobalKey<AnimatedListState>();
  final Tween<Offset> _slideTween = Tween(begin: const Offset(-1, 0), end: const Offset(0, 0));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tasksRaw.isEmpty) {
      return const ErrorPage(text: "No tasks for this day");
    }

    _distributeTasksIntoColumns();

    return ValueListenableBuilder<bool>(
        valueListenable: widget.isBacklogOpen,
        builder: (valueListenableContext, isBacklogOpen, _) {
          Widget backlogColumn = TaskColumn(
            // key: Key("columnUnfolded"),
            correspondingStage: 0,
            tasks: _taskTable[0],
            swapTasksHandler: _onSwapTasks,
            moveTasksHandler: _onMoveTasks,
            movePersonHandler: widget.movePersonHandler,
          );
          List<Widget> columnWidgets = [
            backlogColumn,
            for (int i = 1; i < _taskTable.length; i++)
              TaskColumn(
                correspondingStage: i,
                tasks: _taskTable[i],
                swapTasksHandler: _onSwapTasks,
                moveTasksHandler: _onMoveTasks,
                movePersonHandler: widget.movePersonHandler,
              )
          ];
          if (!isBacklogOpen) backlogColumn = columnWidgets.removeAt(0);
          if (isBacklogOpen != _lastBacklogOpen) {
            if (columnWidgets.length == 7) {
              _rowKey.currentState?.insertItem(0, duration: const Duration(milliseconds: 300));
            } else {
              _rowKey.currentState?.removeItem(
                0,
                (context, animation) => SlideTransition(
                  position: animation.drive(_slideTween),
                  child: SizedBox(
                    width: 125,
                    child: backlogColumn,
                  ),
                ),
                duration: const Duration(milliseconds: 300),
              );
            }
          }
          _lastBacklogOpen = isBacklogOpen;
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: AnimatedList(
              key: _rowKey,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              initialItemCount: columnWidgets.length,
              itemBuilder: (BuildContext context, int index, Animation<double> animation) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / columnWidgets.length - 4,
                  height: 138,
                  child: SlideTransition(
                    position: animation.drive(_slideTween),
                    child: columnWidgets[index],
                  ),
                );
              },
            ),
          );
        });
  }

  _onSwapTasks(TaskCardModel t1, TaskCardModel t2) {
    // final int c1 = AppConst.stageMapping[t1.stage!]!;
    // final int c2 = AppConst.stageMapping[t2.stage!]!;
    // final int r1 = t1.inColumnIndex!;
    // final int r2 = t2.inColumnIndex!;
    // print("swapping r$r1;c$c1 and r$r2;c$c2");
    if (mounted) {
      setState(() {
        // TaskModel taskTemp = _taskTable[c1][r1].copyWith();
        // _taskTable[c1][r1] = _taskTable[c2][r2].copyWith(stage: AppConst.stageIMapping[c1]);
        // _taskTable[c2][r2] = taskTemp.copyWith(stage: AppConst.stageIMapping[c2]);
      });
      // todo отправлять два запроса на мув
      // BoardApi.moveTask(task.id!, _taskTable[toStage].length - 1, AppConst.stageIMapping[toStage]!);
      // BoardApi.moveTask(task.id!, _taskTable[toStage].length - 1, AppConst.stageIMapping[toStage]!);
    }
  }

  _onMoveTasks(TaskCardModel task, int toStage) {
    if (mounted) {
      setState(() {
        BoardApi.moveTask(task.id!, _taskTable[toStage].length - 1, AppConst.stageIMapping[toStage]!);
      });
    }
  }

  void _distributeTasksIntoColumns() {
    _taskTable = [
      widget.tasksRaw.where((e) => e.stage == 7).toList(),
      widget.tasksRaw.where((e) => e.stage == 0).toList(),
      widget.tasksRaw.where((e) => e.stage == 3).toList(),
      widget.tasksRaw.where((e) => e.stage == 1).toList(),
      widget.tasksRaw.where((e) => e.stage == 4).toList(),
      widget.tasksRaw.where((e) => e.stage == 2).toList(),
      widget.tasksRaw.where((e) => e.stage == 5).toList(),
    ];
  }
}
