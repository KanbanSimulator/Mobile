import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban/model/task/task_model.dart';

import '../task_card/task_card_model.dart';

part 'move_person_dto.freezed.dart';

part 'move_person_dto.g.dart';

@freezed
class MovePersonDto with _$MovePersonDto {
  const MovePersonDto._(); // Added constructor

  factory MovePersonDto({
    int? prevCard,
    int? currentCard,
  }) = _MovePersonDto;


  factory MovePersonDto.fromJson(Map<String, dynamic> json) =>
      _$MovePersonDtoFromJson(json);
}