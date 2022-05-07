import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kanban/const/app_assets.dart';
import 'package:kanban/const/app_const.dart';
import 'package:kanban/core/app_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/logo.dart';
import 'auth.dart';
import 'game.dart';
import 'menu.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _loadPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: Center(
        child: Logo(),
      ),
    );
  }

  void _loadPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString("username") ?? AppConst.unnamed;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            (username == AppConst.unnamed ? AuthPage() : MenuPage()),
      ),
    );
  }
}
