import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/widget/people_bank.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_table.dart';

import '../const/app_res.dart';

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
                      children: [
                        Text(AppRes.stageTitle[0], style: AppStyle.stageTitleTextStyle),
                        Text(AppRes.stageTitle[1], style: AppStyle.stageTitleTextStyle),
                        Text(AppRes.stageTitle[2], style: AppStyle.stageTitleTextStyle),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(AppRes.inProgress, style: AppStyle.stageSubTitleTextStyle),
                        Text(AppRes.finished, style: AppStyle.stageSubTitleTextStyle),
                        Text(AppRes.inProgress, style: AppStyle.stageSubTitleTextStyle),
                        Text(AppRes.finished, style: AppStyle.stageSubTitleTextStyle),
                        Text(AppRes.inProgress, style: AppStyle.stageSubTitleTextStyle),
                        Text(AppRes.finished, style: AppStyle.stageSubTitleTextStyle),
                      ],
                    ),
                    const SizedBox(height: 24),
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
