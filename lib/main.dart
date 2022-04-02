import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanban/page/auth.dart';
import 'package:kanban/page/game.dart';
import 'package:kanban/page/splash.dart';

void main() {
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
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: SplashPage(),
    );
  }
}
