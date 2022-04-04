import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanban/const/app_assets.dart';
import 'package:kanban/const/app_res.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/core/app_ui.dart';
import 'package:kanban/page/game.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/text_area_widget.dart';
import 'package:kanban/widget/text_input_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final _usernameFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: const TextArea(text: AppRes.rules),
                ),
              ),
              const SizedBox(width: 100),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.width * 0.15,
                      child: SvgPicture.asset(AppAssets.logo),
                    ),
                    const SizedBox(height: 100),
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
          builder: (context) => const MenuPage(),
        ),
      );
    } else {
      AppUi.toast(context, AppRes.usernameNotValid);
    }
  }
}
