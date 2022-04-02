import 'dart:ui';

import 'package:flutter/material.dart';

class AppStyle {
  static const backgroundColor = Color(0xff222222);

  // colors for stages of development
  static const stageColor = [
    Color(0xffF2B6FF),
    Color(0xffA6C4FF),
    Color(0xffFFE5A1),
  ];
  static const stageTitleTextStyle = TextStyle(
    color: Colors.white,
    letterSpacing: 1.2,
  );

  // task card
  static const taskBackgroundColor =
      Color.fromRGBO(65, 65, 65, 0.9); // background color for task card
  static const taskBorderColor = Color(0xff9E9E9E);
  static const taskTitleTextStyle = TextStyle(
    // task card > title text > style
    color: Colors.white,
    fontSize: 14,
  );
  static const valueTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 9,
  );

  // progress bar
  static const progressBarTextStyle = TextStyle(
    color: Color(0xff3E3E3E),
    fontSize: 12,
  );

  // hint text style
  static const labelTextStyle = TextStyle(
    color: Color(0xff9a9a9a),
    fontSize: 14,
  );

  static final textFieldDecorationBase = InputDecoration(
    contentPadding: const EdgeInsets.all(16).copyWith(left: 24, right: 24),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.grey, width: 0.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.redAccent, width: 0.0),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

}
