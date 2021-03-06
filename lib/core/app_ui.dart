import 'package:flutter/material.dart';

import 'app_style.dart';

class AppUi {
  static void toast(BuildContext context, String text, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          text,
          style: AppStyle.snackBarTextStyle.copyWith(color: color),
        ),
      ),
    );
  }
}
