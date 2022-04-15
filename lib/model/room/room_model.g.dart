// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoomModel _$$_RoomModelFromJson(Map<String, dynamic> json) => _$_RoomModel(
      id: json['id'] as int?,
      player: json['player'] == null
          ? null
          : PlayerModel.fromJson(json['player'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>?)
          ?.map((e) => PlayerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      started: json['started'] as bool?,
    );

Map<String, dynamic> _$$_RoomModelToJson(_$_RoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'player': instance.player,
      'players': instance.players,
      'started': instance.started,
    };
