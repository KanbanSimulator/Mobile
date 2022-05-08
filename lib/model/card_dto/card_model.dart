import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban/model/task/task_model.dart';

part 'card_model.freezed.dart';

part 'card_model.g.dart';

@freezed
class CardModel with _$CardModel {
  const CardModel._(); // Added constructor

  factory CardModel({
    int? id,
    String? title,
    String? team,
    bool? isExpedite,
    int? ordering,
    int? personsAmount,
    int? readyDay,
    int? analyticRemaining,
    int? analyticCompleted,
    int? developRemaining,
    int? developCompleted,
    int? testingRemaining,
    int? testingCompleted,
    String? columnType,
    int? businessValue,
    int? frontColumnType,
  }) = _CardModel;


  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}