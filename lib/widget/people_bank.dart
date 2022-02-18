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
  final double _circleWidth = 104;

  @override
  Widget build(BuildContext context) {
    final double shift = _maxWidth - count * _circleWidth;
    return SizedBox(
      width: _maxWidth,
      height: _circleWidth,
      child: Stack(
        children: List.generate(count, (index) {
          final circle = SimpleShadow(
            opacity: 0.5,
            color: Colors.black,
            offset: const Offset(0, 4),
            sigma: 4,
            child: SvgPicture.asset(
              AppAssets.person,
              width: _circleWidth,
              color: AppStyle.stageColor[stage],
            ),
          );

          double dx = 0;
          if (count > 2) {
            dx = _circleWidth * index + shift / (count - 1) * index;
          } else if (count == 2) {
            dx = (_circleWidth + 2) * index;
          }

          return Positioned(
            right: dx,
            child: circle,
          );
        }),
      ),
    );
  }
}
