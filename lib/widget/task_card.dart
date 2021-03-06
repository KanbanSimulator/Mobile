import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanban/const/app_assets.dart';
import 'package:kanban/core/app_style.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:kanban/widget/people_bank_mini.dart';
import 'package:kanban/widget/progress_bar.dart';

import '../controller/board_controller.dart';
import 'app_button_widget.dart';

class TaskCard extends StatefulWidget {
  TaskModel taskModel;
  final bool isGhost;

  TaskCard({
    Key? key,
    required this.taskModel,
    this.isGhost = false,
  }) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  BoardController boardController = Get.find<BoardController>();

  @override
  void initState() {
    if (widget.taskModel.title == 'Story 0') {
      print("story 0 : widget.taskModel.peopleCount! : ${widget.taskModel.peopleCount!}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        widget.taskModel = boardController.getTaskById(widget.taskModel.id!) ?? widget.taskModel;
        bool _isTaskCompleted = true;
        bool _isTaskBlocked = (widget.taskModel.blockerRemaining ?? 0) > 0;
        bool _isTaskExpedite = (widget.taskModel.isExpedite ?? false);
        for (String p in widget.taskModel.progress ?? []) {
          _isTaskCompleted &= p.split('/')[0] == p.split('/')[1];
        }
        int _blockerProgress = 0;
        Color taskCardBackground = AppStyle.taskBackgroundColor;
        Color taskCardBorderColor = AppStyle.taskBorderColor;
        Color taskCardTextColor = Colors.white;
        if (_isTaskBlocked) {
          var _blockerAll = widget.taskModel.blockerCompleted! + widget.taskModel.blockerRemaining!;
          _blockerProgress = ((widget.taskModel.blockerRemaining!) / _blockerAll * 61).round();
          taskCardBackground = AppStyle.blockedTaskBackgroundColor.withRed(_blockerProgress);
          taskCardBorderColor = AppStyle.blockedTaskBorderColor;
        }
        if (_isTaskExpedite) {
          taskCardBackground = AppStyle.expediteTaskBackgroundColor;
          taskCardTextColor = Colors.white;
          // taskCardTextColor = const Color(0xfffff0b9);
          taskCardBorderColor = const Color(0xfffff0b9);
        }
        return Container(
          width: double.infinity,
          height: 137,
          decoration: BoxDecoration(
            color: taskCardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: taskCardBorderColor),
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
                            style: AppStyle.taskTitleTextStyle.copyWith(color: taskCardTextColor),
                          ),
                          (_isTaskCompleted
                              ? SizedBox(
                                  height: 18,
                                  child: AppButton(
                                    "Complete me",
                                    styleOverride: AppStyle.progressBarTextStyle,
                                    onPressed: () => _onCompletePressed(),
                                  ),
                                )
                              : LongPressDraggable<TaskModel>(
                                  data: widget.taskModel,
                                  delay: const Duration(milliseconds: 1),
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
                                      count: widget.taskModel.peopleCount!,
                                      stage: (widget.taskModel.stage! - 1) % 3,
                                    ),
                                  ),
                                  childWhenDragging: PeopleBankMini(
                                    count: widget.taskModel.peopleCount! - 1,
                                    stage: (widget.taskModel.stage! - 1) % 3,
                                  ),
                                )),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Value: ${widget.taskModel.value}",
                        style: AppStyle.valueTextStyle.copyWith(color: taskCardTextColor),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          // physics: const BouncingScrollPhysics(),
                          itemCount: widget.taskModel.progress!.length,
                          itemBuilder: (context, index) {
                            return ProgressBar.fromProgress(
                              borderColor: taskCardBorderColor,
                              typeColor: AppStyle.stageColor[(index - 1) % 3],
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
              if ((widget.taskModel.blockerRemaining ?? 0) > 0) return false;
              return (task.stage == widget.taskModel.stage);
            },
            onAccept: (TaskModel task) {
              boardController.movePerson(from: task.id, to: widget.taskModel.id);
            },
          ),
        );
      },
    );
  }

  _onCompletePressed() {
    boardController.completeTask(taskId: widget.taskModel.id!);
  }
}
