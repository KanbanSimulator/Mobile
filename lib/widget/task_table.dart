import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/core/api/api_base.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:kanban/model/task_card/task_card_model.dart';
import 'package:kanban/page/error.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_column.dart';

import '../const/app_const.dart';
import '../controller/board_controller.dart';

class TaskTable extends StatefulWidget {
  final List<TaskModel> tasksRaw;

  TaskTable({
    Key? key,
    required this.tasksRaw,
  }) : super(key: key);

  @override
  State<TaskTable> createState() => _TaskTableState();
}

class _TaskTableState extends State<TaskTable> {
  bool _lastBacklogOpen = false;
  final GlobalKey<AnimatedListState> _rowKey = GlobalKey<AnimatedListState>();
  final Tween<Offset> _slideTween = Tween(begin: const Offset(-1, 0), end: const Offset(0, 0));

  BoardController boardController = Get.find<BoardController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tasksRaw.isEmpty) {
      return const ErrorPage(text: "No tasks for this day");
    }

    return Obx(() {
      Widget backlogColumn = TaskColumn(
        correspondingStage: 0,
        tasks: boardController.taskTable[0],
        swapTasksHandler: _onSwapTasks,
      );
      List<Widget> columnWidgets = [
        backlogColumn,
        for (int i = 1; i < boardController.taskTable.length; i++)
          TaskColumn(
            correspondingStage: i,
            tasks: boardController.taskTable[i],
            swapTasksHandler: _onSwapTasks,
          )
      ];
      if (!boardController.isBacklogOpen) backlogColumn = columnWidgets.removeAt(0);
      if (boardController.isBacklogOpen != _lastBacklogOpen) {
        if (columnWidgets.length == 7) {
          _rowKey.currentState?.insertItem(0, duration: const Duration(milliseconds: 300));
        } else {
          _rowKey.currentState?.removeItem(
            0,
            (context, animation) => SlideTransition(
              position: animation.drive(_slideTween),
              child: SizedBox(
                width: 120,
                child: backlogColumn,
              ),
            ),
            duration: const Duration(milliseconds: 300),
          );
        }
      }
      _lastBacklogOpen = boardController.isBacklogOpen;
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
    if (mounted) {
      setState(() {
      });
      // todo ???????????????????? ?????? ?????????????? ???? ??????
    }
  }
}
