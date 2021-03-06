import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kanban/const/app_assets.dart';
import 'package:kanban/core/app_style.dart';
import 'package:kanban/model/task/task_model.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../controller/board_controller.dart';

class PeopleBank extends StatefulWidget {
  final int count;
  final int stage;

  const PeopleBank({
    Key? key,
    required this.count,
    required this.stage,
  }) : super(key: key);

  @override
  State<PeopleBank> createState() => _PeopleBankState();
}

class _PeopleBankState extends State<PeopleBank> {
  final double _maxWidth = 80;
  late int _count;
  final double _personWidth = 104;

  BoardController boardController = Get.find<BoardController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.stage == 0) {
      _count = boardController.board.value.analyticsPeopleBank ?? 0;
    }
    if (widget.stage == 1) {
      _count = boardController.board.value.developmentPeopleBank ?? 0;
    }
    if (widget.stage == 2) {
      _count = boardController.board.value.testingPeopleBank ?? 0;
    }
    final person = SimpleShadow(
      opacity: 0.5,
      color: Colors.black,
      offset: const Offset(0, 4),
      sigma: 4,
      child: SvgPicture.asset(
        AppAssets.person,
        width: _personWidth,
        color: AppStyle.stageColor[(widget.stage - 1) % 3],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        color: AppStyle.columnBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Draggable<TaskModel>(
        feedback: person,
        data: TaskModel(
          stage: widget.stage,
          title: '',
          value: -1,
          progress: ['', '', ''],
        ),
        child: DragTarget<TaskModel>(
          builder: (BuildContext context, List<Object?> candidateData, List rejectedData) {
            return _buildPeopleStack(_count, person);
          },
          onWillAccept: (TaskModel? task) {
            if (task == null) return false;
            return (task.stage == widget.stage);
          },
          onAccept: (TaskModel task) {
            boardController.movePerson(from: task.id, to: null);
          },
        ),
        childWhenDragging: _buildPeopleStack(_count - 1, person),
      ),
    );
  }

  Widget _buildPeopleStack(count, person) {
    final double shift = _maxWidth - count * _personWidth;
    return SizedBox(
      width: _maxWidth,
      height: _personWidth,
      child: count <= 0
          ? const SizedBox.shrink()
          : Stack(
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.red,
                //   ),
                // ),
                ...List.generate(count, (index) {
                  double dx = 0;
                  if (count > 2) {
                    dx = _personWidth * index + shift / (count - 1) * index;
                  } else if (count == 2) {
                    dx = (_maxWidth / 2 - _personWidth / 2) * index;
                  } else if (count == 1) {
                    // dx = shift/2;
                  }

                  return Positioned(
                    right: dx,
                    child: person,
                  );
                }),
              ],
            ),
    );
  }
}
