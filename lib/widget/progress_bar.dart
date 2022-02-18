import 'dart:developer';

import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  String? progress;
  String? numerator;
  String? denominator;
  Color typeColor;

  ProgressBar.fromProgress({
    Key? key,
    required this.progress,
    this.typeColor = Colors.white,
  }) : super(key: key) {
    numerator = progress!.split('/')[0];
    denominator = progress!.split('/')[1];
    log("progress: $progress");
    log("num: $numerator");
    log("denom: $denominator");
  }

  ProgressBar.fromNumeratorAndDenominator({
    Key? key,
    required this.numerator,
    required this.denominator,
    this.typeColor = Colors.white,
  }) : super(key: key) {
    progress = "$numerator/$denominator";
    log("progress: $progress");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 17,
      decoration: BoxDecoration(
        color: typeColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: Text(
          "$numerator/$denominator",
        ),
      ),
    );
  }
}
