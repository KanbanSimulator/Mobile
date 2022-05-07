import 'package:flutter/material.dart';
import 'package:kanban/const/app_const.dart';
import 'package:kanban/core/app_style.dart';
import 'package:kanban/core/cache_service.dart';
import 'package:kanban/page/auth.dart';
import 'package:kanban/page/game.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'join.dart';
import 'create.dart';

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
    username = CacheService.getUsername();
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
                            ? "You are:\n${snapshot.data}"
                            : "..."),
                        textAlign: TextAlign.end,
                        style: AppStyle.h2,
                      ),
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
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 150,
                      height: 36,
                      child: AppButton(
                        "Create Room",
                        onPressed: () => _onStartGamePressed(context),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 150,
                      height: 36,
                      child: AppButton(
                        "Join Room",
                        onPressed: () => _onJoinPressed(context),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 150,
                      height: 36,
                      child: AppButton(
                        "Log out",
                        onPressed: () => _onLogOutPressed(context),
                      ),
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
    CacheService.clearCredentials();
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
        builder: (context) => CreatePage(),
      ),
    );
  }

  void _onJoinPressed(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JoinPage(),
      ),
    );
  }

}
