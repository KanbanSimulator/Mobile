import 'package:flutter/material.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_table.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TaskTable(day: 0),
          ],
        ),
      ),
    );
  }
}
