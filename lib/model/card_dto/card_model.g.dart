// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardModel _$$_CardModelFromJson(Map<String, dynamic> json) => _$_CardModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      team: json['team'] as String?,
      isExpedite: json['isExpedite'] as bool?,
      ordering: json['ordering'] as int?,
      personsAmount: json['personsAmount'] as int?,
      readyDay: json['readyDay'] as int?,
      analyticRemaining: json['analyticRemaining'] as int?,
      analyticCompleted: json['analyticCompleted'] as int?,
      developRemaining: json['developRemaining'] as int?,
      developCompleted: json['developCompleted'] as int?,
      testingRemaining: json['testingRemaining'] as int?,
      testingCompleted: json['testingCompleted'] as int?,
      columnType: json['columnType'] as String?,
      businessValue: json['businessValue'] as int?,
      frontColumnType: json['frontColumnType'] as int?,
    );

Map<String, dynamic> _$$_CardModelToJson(_$_CardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'team': instance.team,
      'isExpedite': instance.isExpedite,
      'ordering': instance.ordering,
      'personsAmount': instance.personsAmount,
      'readyDay': instance.readyDay,
      'analyticRemaining': instance.analyticRemaining,
      'analyticCompleted': instance.analyticCompleted,
      'developRemaining': instance.developRemaining,
      'developCompleted': instance.developCompleted,
      'testingRemaining': instance.testingRemaining,
      'testingCompleted': instance.testingCompleted,
      'columnType': instance.columnType,
      'businessValue': instance.businessValue,
      'frontColumnType': instance.frontColumnType,
    };
