import 'dart:ui';

import 'package:flutter/material.dart';

class AppStyle {
  static const backgroundColor = Color(0xff222222);

  // colors for stages of development
  static const stageColor = [
    Color(0xffF2B6FF),
    Color(0xffA6C4FF),
    Color(0xffFFE5A1)
  ];

  // background color for task card
  static const taskBackgroundColor = Color.fromRGBO(65, 65, 65, 0.9);

  // task card > title text > style
  static const taskTitleTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
  );
}
