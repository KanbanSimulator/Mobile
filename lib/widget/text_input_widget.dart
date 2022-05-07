import 'package:flutter/material.dart';
import 'package:kanban/core/app_style.dart';

class TextInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const TextInput({
    Key? key,
    this.placeholder = "",
    required this.controller,
    this.keyboardType,
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
      keyboardType: keyboardType,
    );
  }
}
