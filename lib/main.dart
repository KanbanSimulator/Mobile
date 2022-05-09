import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanban/controller/board_controller.dart';
import 'package:kanban/controller/lp_controller.dart';
import 'package:kanban/page/auth.dart';
import 'package:kanban/page/game.dart';
import 'package:kanban/page/splash.dart';

import 'controller/room_controller.dart';
import 'core/app_style.dart';

void main() {
  Get.put(RoomController());
  Get.put(LPController());
  Get.put(BoardController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kanban',
      // home: GamePage(),
      home: SplashPage(),
    );
  }
}
