import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.freezed.dart';

@freezed
class PlayerModel with _$PlayerModel {
  factory PlayerModel({
    int? id,
    bool? creator,
    String? name,
    int? teamNumber,
  }) = _PlayerModel;
}
