import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban/model/card_dto/card_model.dart';
import 'package:kanban/model/task/task_model.dart';

part 'board_model.freezed.dart';

part 'board_model.g.dart';

@freezed
class BoardModel with _$BoardModel {
  const BoardModel._(); // Added constructor

  factory BoardModel({
    @JsonKey(name: "analyticsFreePersons") int? analyticsPeopleBank,
    @JsonKey(name: "developmentFreePersons") int? developmentPeopleBank,
    @JsonKey(name: "testFreePersons") int? testingPeopleBank,
    int? day,
    List<CardModel>? cards,
    int? teamId,
  }) = _BoardModel;

  factory BoardModel.fromJson(Map<String, dynamic> json) => _$BoardModelFromJson(json);
}
