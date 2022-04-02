import 'package:flutter/material.dart';
import 'package:kanban/const/app_style.dart';

class TextArea extends StatelessWidget {
  final String text;

  const TextArea({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppStyle.taskBackgroundColor,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
