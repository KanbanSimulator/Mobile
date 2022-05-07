import 'package:flutter/material.dart';
import 'package:kanban/core/app_style.dart';

class PeopleBankMini extends StatelessWidget {
  final int count;
  final int stage;

  const PeopleBankMini({
    Key? key,
    required this.count,
    required this.stage,
  }) : super(key: key);

  final double _maxWidth = 34;
  final double _circleWidth = 10;

  @override
  Widget build(BuildContext context) {
    final double shift = _maxWidth - count * _circleWidth;
    return SizedBox(
      width: _maxWidth,
      height: _circleWidth,
      child: Stack(
        children: List.generate(count, (index) {
          final circle = Container(
            width: _circleWidth,
            height: _circleWidth,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppStyle.stageColor[stage],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
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
