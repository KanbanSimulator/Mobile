import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final String numerator;
  final String denominator;
  final Color typeColor;

  const ProgressBar({
    Key? key,
    this.numerator = "?",
    this.denominator = "?",
    this.typeColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 17,
      decoration: BoxDecoration(
        color: typeColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: Text(
          "$numerator/$denominator",
        ),
      ),
    );
  }
}
