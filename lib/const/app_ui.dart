import 'package:flutter/material.dart';

import 'app_style.dart';

class AppUi {
  static void toast(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: AppStyle.snackBarTextStyle,
        ),
      ),
    );
  }
}
