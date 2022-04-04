import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban/model/player_model.dart';

part 'room_model.freezed.dart';

@freezed
class RoomModel with _$RoomModel {
  factory RoomModel({
    int? id,
    PlayerModel? player,
    List<PlayerModel>? players,
    bool? started,
  }) = _RoomModel;
}
