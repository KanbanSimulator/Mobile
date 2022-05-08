import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kanban/const/app_assets.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/core/app_style.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:kanban/widget/people_bank_mini.dart';
import 'package:kanban/widget/progress_bar.dart';

class TaskCard extends StatefulWidget {
  TaskModel taskModel;
  final bool isGhost;
  ValueNotifier<bool> notifier;
  final Function movePersonHandler;

  TaskCard({
    Key? key,
    required this.taskModel,
    this.isGhost = false,
    required this.notifier,
    required this.movePersonHandler,
  }) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  late int _count;
  bool _prevVal = false; // это костыль для прокидывания обновления вниз в карточку

  @override
  void initState() {
    _count = widget.taskModel.peopleCount![(widget.taskModel.stage! - 1) % 3];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.notifier,
      builder: (valueListenableContext, bool newVal, _) {
        if (_prevVal != newVal) { // если пришел newVal (значит произошло прокидывание по свапу)
          _prevVal = newVal; // то сохраним чтобы в следующий раз отличать новый от старого
          _count = widget.taskModel.peopleCount![widget.taskModel.stage! % 3]; // и обновим counter людей
        }
        return Container(
          width: double.infinity,
          height: 137,
          decoration: BoxDecoration(
            color: AppStyle.taskBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppStyle.taskBorderColor),
          ),
          child: DragTarget<TaskModel>(
            builder: (
              BuildContext context,
              List<Object?> candidateData,
              List<dynamic> rejectedData,
            ) {
              return ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(colors: [
                    widget.isGhost ? Colors.white24 : Colors.white,
                    widget.isGhost ? Colors.white24 : Colors.white,
                  ]).createShader(bounds);
                },
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
                            widget.taskModel.title!,
                            style: AppStyle.taskTitleTextStyle,
                          ),
                          LongPressDraggable<TaskModel>(
                            data: widget.taskModel,
                            delay: const Duration(milliseconds: 1),
                            onDragCompleted: () {
                              setState(() {
                                _count--;
                                widget.taskModel.peopleCount![(widget.taskModel.stage! - 1) % 3] = _count;
                              });
                            },
                            feedback: Container(
                              decoration: const BoxDecoration(color: Colors.transparent),
                              child: SvgPicture.asset(
                                AppAssets.person,
                                fit: BoxFit.fitWidth,
                                width: 100,
                                color: AppStyle.stageColor[(widget.taskModel.stage! - 1) % 3],
                              ),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(color: Colors.transparent),
                              child: PeopleBankMini(
                                count: _count,
                                stage: (widget.taskModel.stage! - 1) % 3,
                              ),
                            ),
                            childWhenDragging: PeopleBankMini(
                              count: _count - 1,
                              stage: (widget.taskModel.stage! - 1) % 3,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Value: ${widget.taskModel.value}",
                        style: AppStyle.valueTextStyle,
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          // physics: const BouncingScrollPhysics(),
                          itemCount: widget.taskModel.progress!.length,
                          itemBuilder: (context, index) {
                            return ProgressBar.fromProgress(
                              typeColor: AppStyle.stageColor[index],
                              progress: widget.taskModel.progress![index],
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
            },
            onWillAccept: (TaskModel? task) {
              if (task == null) return false;
              return (task.stage == widget.taskModel.stage);
            },
            onAccept: (TaskModel task) {
              widget.movePersonHandler(from: task.id, to: widget.taskModel.id);
              setState(() {
                _count++;
                widget.taskModel.peopleCount![(widget.taskModel.stage! - 1) % 3] = _count;
              });
            },
          ),
        );
      },
    );
  }
}
