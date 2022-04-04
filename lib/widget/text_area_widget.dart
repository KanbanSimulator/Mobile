import 'package:flutter/material.dart';
import 'package:kanban/const/app_style.dart';

class TextArea extends StatelessWidget {
  final String text;

  const TextArea({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppStyle.taskBackgroundColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Color(0x66FFFFFF), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
