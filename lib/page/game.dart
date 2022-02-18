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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PeopleBank(
                      stage: 0,
                      count: 3,
                    ),
                    PeopleBank(
                      stage: 1,
                      count: 3,
                    ),
                    PeopleBank(
                      stage: 2,
                      count: 3,
                    ),
                  ],
                ),
              ),
              Expanded(child: TaskTable(day: 0)),
            ],
          ),
        ),
      ),
    );
  }
}
