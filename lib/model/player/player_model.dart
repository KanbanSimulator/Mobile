import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.freezed.dart';

part 'player_model.g.dart';

@freezed
class PlayerModel with _$PlayerModel {
  factory PlayerModel({
    int? id,
    bool? creator,
    String? name,
    int? teamNumber,
    int? teamId,
    bool? spectator,
  }) = _PlayerModel;

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);
}
