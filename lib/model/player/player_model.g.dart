// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerModel _$$_PlayerModelFromJson(Map<String, dynamic> json) =>
    _$_PlayerModel(
      id: json['id'] as int?,
      creator: json['creator'] as bool?,
      name: json['name'] as String?,
      teamNumber: json['teamNumber'] as int?,
    );

Map<String, dynamic> _$$_PlayerModelToJson(_$_PlayerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creator': instance.creator,
      'name': instance.name,
      'teamNumber': instance.teamNumber,
    };
