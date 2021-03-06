import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban/model/task/task_model.dart';

part 'task_card_model.freezed.dart';

@freezed
class TaskCardModel with _$TaskCardModel {
  const TaskCardModel._(); // Added constructor

  factory TaskCardModel({
    int? id,
    String? title,
    List<String>? progress, // list of progresses
    int? value,
    int? stage,
    int? peopleCount, // list of people on each stage
    int? inColumnIndex,
    int? blockerCompleted,
    int? blockerRemaining,
    bool? isExpedite,
  }) = _TaskCardModel;

  static TaskCardModel fromTaskModel(TaskModel task, int inColumnIndex) {
    return TaskCardModel(
      id: task.id ?? -1,
      title: task.title ?? "",
      progress: task.progress ?? [], // list of progresses
      value: task.value ?? -1,
      stage: task.stage ?? -1,
      peopleCount: task.peopleCount ?? 0,
      inColumnIndex: inColumnIndex,
      blockerCompleted: task.blockerCompleted,
      blockerRemaining: task.blockerRemaining,
      isExpedite: task.isExpedite,
    );
  }
}
