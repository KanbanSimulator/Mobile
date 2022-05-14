import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kanban/core/app_style.dart';

class ProgressBar extends StatelessWidget {
  String? progress;
  String? numerator;
  String? denominator;
  Color typeColor;
  Color borderColor;

  ProgressBar.fromProgress({
    Key? key,
    required this.progress,
    this.typeColor = Colors.white,
    this.borderColor = AppStyle.taskBorderColor,
  }) : super(key: key) {
    numerator = progress!.split('/')[0];
    denominator = progress!.split('/')[1];
  }

  ProgressBar.fromNumeratorAndDenominator({
    Key? key,
    required this.numerator,
    required this.denominator,
    this.typeColor = Colors.white,
    this.borderColor = AppStyle.taskBorderColor,
  }) : super(key: key) {
    progress = "$numerator/$denominator";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 17,
      decoration: BoxDecoration(
        color: typeColor,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: Text(
          progress!,
          style: AppStyle.progressBarTextStyle,
        ),
      ),
    );
  }
}
