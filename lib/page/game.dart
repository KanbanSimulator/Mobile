import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/core/api.dart';
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
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        PeopleBank(count: 3, stage: 0),
                        PeopleBank(count: 3, stage: 1),
                        PeopleBank(count: 3, stage: 2),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text("Analysis", style: AppStyle.stageTitleTextStyle),
                        Text("Finished", style: AppStyle.stageTitleTextStyle),
                        Text("Development", style: AppStyle.stageTitleTextStyle),
                        Text("Finished", style: AppStyle.stageTitleTextStyle),
                        Text("Testing", style: AppStyle.stageTitleTextStyle),
                        Text("Finished", style: AppStyle.stageTitleTextStyle),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: TaskTable(
                  tasksFuture: Api.getTasks(0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
