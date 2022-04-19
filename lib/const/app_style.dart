import 'dart:ui';

import 'package:flutter/material.dart';

class AppStyle {
  static const backgroundColor = Color(0xff222222);

  // menu page
  static const pageHeaderTextStyle = TextStyle(
    fontSize: 24,
    color: Colors.white,
    letterSpacing: 1.5,
  );

  static const h2 = TextStyle(
    color: Colors.white,
    fontSize: 12,
  );

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
  static const stageSubTitleTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
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
    letterSpacing: 1.8,
  );

  static const buttonTextStyle = TextStyle(
    color: Color(0xff9a9a9a),
    fontSize: 15,
    fontWeight: FontWeight.w800,
  );

  static final buttonDecoration = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(color: Colors.white),
      ),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    // textStyle: MaterialStateProperty.all(buttonTextStyle),
  );

  // text field border style
  static final textFieldDecorationBase = InputDecoration(
    fillColor: Colors.white,
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

  // text field text style
  static const textFieldStyle = TextStyle(
    color: Color(0xff9a9a9a),
    fontSize: 14,
    letterSpacing: 1.8,
  );

  // utils
  static const snackBarTextStyle = TextStyle(
    color: Colors.redAccent,
    fontSize: 16,
  );
}
