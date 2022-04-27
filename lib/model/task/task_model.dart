import 'package:freezed_annotation/freezed_annotation.dart';

import '../task_card/task_card_model.dart';

part 'task_model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  const TaskModel._(); // Added constructor

  factory TaskModel({
    String? title,
    List<String>? progress, // list of progresses
    int? value,
    int? stage,
    List<int>? peopleCount, // list of people on each stage
  }) = _TaskModel;

  static TaskModel fromTaskCardModel(TaskCardModel task) {
    return TaskModel(
      title: task.title ?? "",
      progress: task.progress ?? [], // list of progresses
      value: task.value ?? -1,
      stage: task.stage ?? -1,
      peopleCount: task.peopleCount ?? [],
    );
  }
}
