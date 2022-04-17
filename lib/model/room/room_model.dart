import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban/model/player/player_model.dart';
import 'package:kanban/model/team_dto/team_dto.dart';

part 'room_model.freezed.dart';
part 'room_model.g.dart';

@freezed
class RoomModel with _$RoomModel {
  factory RoomModel({
    int? id,
    PlayerModel? player,
    List<PlayerModel>? players,
    bool? started,
    List<TeamDto>? teams,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);

}
