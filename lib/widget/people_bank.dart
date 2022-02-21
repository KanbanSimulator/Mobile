import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanban/const/app_assets.dart';
import 'package:kanban/const/app_style.dart';
import 'package:simple_shadow/simple_shadow.dart';

class PeopleBank extends StatelessWidget {
  final int count;
  final int stage;

  const PeopleBank({
    Key? key,
    required this.count,
    required this.stage,
  }) : super(key: key);

  final double _maxWidth = 80;
  final double _personWidth = 104;

  @override
  Widget build(BuildContext context) {
    final person = SimpleShadow(
      opacity: 0.5,
      color: Colors.black,
      offset: const Offset(0, 4),
      sigma: 4,
      child: SvgPicture.asset(
        AppAssets.person,
        width: _personWidth,
        color: AppStyle.stageColor[stage],
      ),
    );
    return Draggable(
      feedback: person,
      child: buildPeopleStack(count, person),
      childWhenDragging: buildPeopleStack(count - 1, person),
    );
  }

  Widget buildPeopleStack(count, person) {
    final double shift = _maxWidth - count * _personWidth;
    return SizedBox(
      width: _maxWidth,
      height: _personWidth,
      child: Stack(
        children: List.generate(count, (index) {
          double dx = 0;
          if (count > 2) {
            dx = _personWidth * index + shift / (count - 1) * index;
          } else if (count == 2) {
            dx = (_maxWidth/2 - _personWidth/2) * index;
            print("dx: $dx");
          } else if (count == 1) {
            print("count1 dx: $dx");
            // dx = shift/2;
          }

          return Positioned(
            right: dx,
            child: person,
          );
        }),
      ),
    );
  }
}
