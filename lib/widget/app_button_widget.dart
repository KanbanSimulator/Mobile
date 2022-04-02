import 'package:flutter/material.dart';
import 'package:kanban/const/app_style.dart';

class AppButton extends StatelessWidget {
  final onPressed;
  final String text;

  AppButton(
    this.text, {
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppStyle.buttonDecoration,
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyle.buttonTextStyle,
      ),
    );
  }
}
