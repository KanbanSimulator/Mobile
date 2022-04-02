import 'package:flutter/material.dart';
import 'package:kanban/const/app_const.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/page/auth.dart';
import 'package:kanban/page/game.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuPage> createState() => _MenupageState();
}

class _MenupageState extends State<MenuPage> {
  late final Future<String> username;

  @override
  void initState() {
    username = _getCredentials();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(86.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: FutureBuilder(
                      future: username,
                      builder: (context, snapshot) => Text(
                        (snapshot.hasData
                            ? "You are: ${snapshot.data}"
                            : "..."),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: AppButton(
                      "Log out",
                      onPressed: () => _onLogOutPressed(context),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      "Menu",
                      style: AppStyle.pageHeaderTextStyle,
                    ),
                    AppButton(
                      "Start Game",
                      onPressed: () => _onStartGamePressed(context),
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

  void _onLogOutPressed(context) {
    _clearCredentials();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AuthPage(),
      ),
    );
  }

  void _onStartGamePressed(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GamePage(),
      ),
    );
  }

  void _clearCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
  }

  Future<String> _getCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("username") ?? AppConst.unnamed;
  }
}
