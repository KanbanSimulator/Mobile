import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanban/const/app_assets.dart';
import 'package:kanban/const/app_res.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/widget/text_area_widget.dart';
import 'package:kanban/widget/text_input_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  get _usernameFieldController => TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Expanded(
              child: TextArea(text: AppRes.rules),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: SvgPicture.asset(AppAssets.logo),
                  ),
                  TextInput(
                    placeholder: "Enter your username here...",
                    controller: _usernameFieldController,
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
