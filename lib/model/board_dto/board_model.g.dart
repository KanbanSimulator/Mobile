// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BoardModel _$$_BoardModelFromJson(Map<String, dynamic> json) =>
    _$_BoardModel(
      analyticsPeopleBank: json['analyticsFreePersons'] as int?,
      developmentPeopleBank: json['developmentFreePersons'] as int?,
      testingPeopleBank: json['testFreePersons'] as int?,
      day: json['day'] as int?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      teamId: json['teamId'] as int?,
    );

Map<String, dynamic> _$$_BoardModelToJson(_$_BoardModel instance) =>
    <String, dynamic>{
      'analyticsFreePersons': instance.analyticsPeopleBank,
      'developmentFreePersons': instance.developmentPeopleBank,
      'testFreePersons': instance.testingPeopleBank,
      'day': instance.day,
      'cards': instance.cards,
      'teamId': instance.teamId,
    };
