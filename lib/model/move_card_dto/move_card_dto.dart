import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban/model/task/task_model.dart';

import '../task_card/task_card_model.dart';

part 'move_card_dto.freezed.dart';

part 'move_card_dto.g.dart';

@freezed
class MoveCardDto with _$MoveCardDto {
  const MoveCardDto._(); // Added constructor

  factory MoveCardDto({
    int? cardId,
    int? ordering,
    int? columnNumber,
  }) = _MoveCardDto;


  factory MoveCardDto.fromJson(Map<String, dynamic> json) =>
      _$MoveCardDtoFromJson(json);
}