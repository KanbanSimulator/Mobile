import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/widget/people_bank.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_table.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Spacer(),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        PeopleBank(
                          stage: 0,
                          count: 2,
                        ),
                        Text("analysis", style: AppStyle.stageTitleTextStyle),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        PeopleBank(
                          stage: 1,
                          count: 3,
                        ),
                        Text("development",
                            style: AppStyle.stageTitleTextStyle),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        PeopleBank(
                          stage: 2,
                          count: 1,
                        ),
                        Text("testing", style: AppStyle.stageTitleTextStyle),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(flex: 4, child: TaskTable(day: 0)),
            ],
          ),
        ),
      ),
    );
  }
}
