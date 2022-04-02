import 'package:flutter/material.dart';
import 'package:kanban/const/app_style.dart';

class TextInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;

  const TextInput({
    Key? key,
    this.placeholder = "",
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: AppStyle.textFieldDecorationBase.copyWith(
        labelText: placeholder,
        labelStyle: AppStyle.labelTextStyle,
        hintStyle: AppStyle.labelTextStyle,
      ),
      style: AppStyle.textFieldStyle,
      controller: controller,
    );
  }
}
