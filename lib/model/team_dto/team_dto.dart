import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban/model/player/player_model.dart';

part 'team_dto.freezed.dart';

part 'team_dto.g.dart';

@freezed
class TeamDto with _$TeamDto {
  factory TeamDto({
    int? teamId,
    int? teamNumber,
  }) = _TeamDto;

  factory TeamDto.fromJson(Map<String, dynamic> json) =>
      _$TeamDtoFromJson(json);
}
