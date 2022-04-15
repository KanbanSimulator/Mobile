import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  factory TaskModel({
    String? title,
    List<String>? progress, // list of progresses
    int? value,
    int? stage,
    List<int>? peopleCount, // list of people on each stage
  }) = _TaskModel;
}
