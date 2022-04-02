import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanban/const/app_assets.dart';
import 'package:kanban/const/app_res.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/const/app_ui.dart';
import 'package:kanban/page/game.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/text_area_widget.dart';
import 'package:kanban/widget/text_input_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final _usernameFieldController = TextEditingController();

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
              flex: 2,
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
                  const SizedBox(height: 64),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextInput(
                          placeholder: "Username",
                          controller: _usernameFieldController,
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 64,
                        height: 50,
                        child: AppButton(
                          "Go",
                          onPressed: () => _onGoPressed(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateUsername(String username) {
    return username.length >= 4;
  }

  void _storeCredentials({required String username}) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("username", username);
  }

  void _onGoPressed(context) async {
    final uname = _usernameFieldController.text;
    print("username field $uname");
    if (_validateUsername(uname)) {
      _storeCredentials(username: uname);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const GamePage(),
        ),
      );
    } else {
      AppUi.toast(context, AppRes.usernameNotValid);
    }
  }
}
