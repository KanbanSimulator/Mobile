import 'package:flutter/material.dart';

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
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: placeholder,
      ),
      controller: controller,
    );
  }
}
