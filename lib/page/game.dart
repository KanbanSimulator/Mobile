import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/people_bank.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_table.dart';

import '../const/app_res.dart';
import '../widget/logo.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.backgroundColor,
        body: Builder(
          builder: (context) => Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: 64,
                  decoration: const BoxDecoration(color: AppStyle.columnBgColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 48,
                          height: 48,
                          child: Logo(),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 140,
                                height: 48,
                                child: AppButton(
                                  "Backlog",
                                  leading: const Icon(
                                    Icons.my_library_books_rounded,
                                    color: AppStyle.iconColor,
                                  ),
                                  onPressed: () => _onBacklogPressed(context),
                                ),
                              ),
                              const SizedBox(width: 48),
                              SizedBox(
                                width: 200,
                                height: 48,
                                child: AppButton(
                                  "Complete this day",
                                  leading: const Icon(
                                    Icons.done_outline_rounded,
                                    color: AppStyle.iconColor,
                                  ),
                                  onPressed: _onCompleteDayPressed,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
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
                        flex: 2,
                        child: TaskTable(
                          tasksFuture: Api.getTasks(0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        endDrawer: Container(
          width: 500,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
          ),
          child: Drawer(
            child: ListView.builder(
              itemBuilder: (context, index) => Text("$index"),
            ),
          ),
        ),
      ),
    );
  }

  _onBacklogPressed(context) {
    print("backlog show");
    Scaffold.of(context).openEndDrawer();
  }

  _onCompleteDayPressed() {
    print("complete day");
  }
}
