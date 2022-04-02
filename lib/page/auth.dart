import 'package:flutter/material.dart';
import 'package:kanban/const/app_res.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/widget/text_area_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: Center(
        child: Row(
          children: [
            const Expanded(
              child: TextArea(text: AppRes.rules),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Enter your username",
                    style: AppStyle.hintTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
