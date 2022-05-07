import 'package:flutter/material.dart';
import 'package:kanban/widget/task_card.dart';
import 'package:kanban/widget/task_column.dart';

import '../model/task/task_model.dart';

class BacklogView extends StatefulWidget {
  final List<TaskModel> tasksRaw;

  const BacklogView({
    Key? key,
    this.tasksRaw = const [],
  }) : super(key: key);

  @override
  State<BacklogView> createState() => _BacklogViewState();
}

class _BacklogViewState extends State<BacklogView> {
  late List<TaskModel> tasks;

  @override
  void initState() {
    tasks = widget.tasksRaw.where((e) => e.stage == 7).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
