// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'board_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BoardModel _$BoardModelFromJson(Map<String, dynamic> json) {
  return _BoardModel.fromJson(json);
}

/// @nodoc
class _$BoardModelTearOff {
  const _$BoardModelTearOff();

  _BoardModel call(
      {@JsonKey(name: "analyticsFreePersons") int? analyticsPeopleBank,
      @JsonKey(name: "developmentFreePersons") int? developmentPeopleBank,
      @JsonKey(name: "testFreePersons") int? testingPeopleBank,
      int? day,
      List<CardModel>? cards,
      int? teamId}) {
    return _BoardModel(
      analyticsPeopleBank: analyticsPeopleBank,
      developmentPeopleBank: developmentPeopleBank,
      testingPeopleBank: testingPeopleBank,
      day: day,
      cards: cards,
      teamId: teamId,
    );
  }

  BoardModel fromJson(Map<String, Object?> json) {
    return BoardModel.fromJson(json);
  }
}

/// @nodoc
const $BoardModel = _$BoardModelTearOff();

/// @nodoc
mixin _$BoardModel {
  @JsonKey(name: "analyticsFreePersons")
  int? get analyticsPeopleBank => throw _privateConstructorUsedError;
  @JsonKey(name: "developmentFreePersons")
  int? get developmentPeopleBank => throw _privateConstructorUsedError;
  @JsonKey(name: "testFreePersons")
  int? get testingPeopleBank => throw _privateConstructorUsedError;
  int? get day => throw _privateConstructorUsedError;
  List<CardModel>? get cards => throw _privateConstructorUsedError;
  int? get teamId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardModelCopyWith<BoardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardModelCopyWith<$Res> {
  factory $BoardModelCopyWith(
          BoardModel value, $Res Function(BoardModel) then) =
      _$BoardModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "analyticsFreePersons") int? analyticsPeopleBank,
      @JsonKey(name: "developmentFreePersons") int? developmentPeopleBank,
      @JsonKey(name: "testFreePersons") int? testingPeopleBank,
      int? day,
      List<CardModel>? cards,
      int? teamId});
}

/// @nodoc
class _$BoardModelCopyWithImpl<$Res> implements $BoardModelCopyWith<$Res> {
  _$BoardModelCopyWithImpl(this._value, this._then);

  final BoardModel _value;
  // ignore: unused_field
  final $Res Function(BoardModel) _then;

  @override
  $Res call({
    Object? analyticsPeopleBank = freezed,
    Object? developmentPeopleBank = freezed,
    Object? testingPeopleBank = freezed,
    Object? day = freezed,
    Object? cards = freezed,
    Object? teamId = freezed,
  }) {
    return _then(_value.copyWith(
      analyticsPeopleBank: analyticsPeopleBank == freezed
          ? _value.analyticsPeopleBank
          : analyticsPeopleBank // ignore: cast_nullable_to_non_nullable
              as int?,
      developmentPeopleBank: developmentPeopleBank == freezed
          ? _value.developmentPeopleBank
          : developmentPeopleBank // ignore: cast_nullable_to_non_nullable
              as int?,
      testingPeopleBank: testingPeopleBank == freezed
          ? _value.testingPeopleBank
          : testingPeopleBank // ignore: cast_nullable_to_non_nullable
              as int?,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardModel>?,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$BoardModelCopyWith<$Res> implements $BoardModelCopyWith<$Res> {
  factory _$BoardModelCopyWith(
          _BoardModel value, $Res Function(_BoardModel) then) =
      __$BoardModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "analyticsFreePersons") int? analyticsPeopleBank,
      @JsonKey(name: "developmentFreePersons") int? developmentPeopleBank,
      @JsonKey(name: "testFreePersons") int? testingPeopleBank,
      int? day,
      List<CardModel>? cards,
      int? teamId});
}

/// @nodoc
class __$BoardModelCopyWithImpl<$Res> extends _$BoardModelCopyWithImpl<$Res>
    implements _$BoardModelCopyWith<$Res> {
  __$BoardModelCopyWithImpl(
      _BoardModel _value, $Res Function(_BoardModel) _then)
      : super(_value, (v) => _then(v as _BoardModel));

  @override
  _BoardModel get _value => super._value as _BoardModel;

  @override
  $Res call({
    Object? analyticsPeopleBank = freezed,
    Object? developmentPeopleBank = freezed,
    Object? testingPeopleBank = freezed,
    Object? day = freezed,
    Object? cards = freezed,
    Object? teamId = freezed,
  }) {
    return _then(_BoardModel(
      analyticsPeopleBank: analyticsPeopleBank == freezed
          ? _value.analyticsPeopleBank
          : analyticsPeopleBank // ignore: cast_nullable_to_non_nullable
              as int?,
      developmentPeopleBank: developmentPeopleBank == freezed
          ? _value.developmentPeopleBank
          : developmentPeopleBank // ignore: cast_nullable_to_non_nullable
              as int?,
      testingPeopleBank: testingPeopleBank == freezed
          ? _value.testingPeopleBank
          : testingPeopleBank // ignore: cast_nullable_to_non_nullable
              as int?,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardModel>?,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BoardModel extends _BoardModel {
  _$_BoardModel(
      {@JsonKey(name: "analyticsFreePersons") this.analyticsPeopleBank,
      @JsonKey(name: "developmentFreePersons") this.developmentPeopleBank,
      @JsonKey(name: "testFreePersons") this.testingPeopleBank,
      this.day,
      this.cards,
      this.teamId})
      : super._();

  factory _$_BoardModel.fromJson(Map<String, dynamic> json) =>
      _$$_BoardModelFromJson(json);

  @override
  @JsonKey(name: "analyticsFreePersons")
  final int? analyticsPeopleBank;
  @override
  @JsonKey(name: "developmentFreePersons")
  final int? developmentPeopleBank;
  @override
  @JsonKey(name: "testFreePersons")
  final int? testingPeopleBank;
  @override
  final int? day;
  @override
  final List<CardModel>? cards;
  @override
  final int? teamId;

  @override
  String toString() {
    return 'BoardModel(analyticsPeopleBank: $analyticsPeopleBank, developmentPeopleBank: $developmentPeopleBank, testingPeopleBank: $testingPeopleBank, day: $day, cards: $cards, teamId: $teamId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BoardModel &&
            const DeepCollectionEquality()
                .equals(other.analyticsPeopleBank, analyticsPeopleBank) &&
            const DeepCollectionEquality()
                .equals(other.developmentPeopleBank, developmentPeopleBank) &&
            const DeepCollectionEquality()
                .equals(other.testingPeopleBank, testingPeopleBank) &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.cards, cards) &&
            const DeepCollectionEquality().equals(other.teamId, teamId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(analyticsPeopleBank),
      const DeepCollectionEquality().hash(developmentPeopleBank),
      const DeepCollectionEquality().hash(testingPeopleBank),
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(cards),
      const DeepCollectionEquality().hash(teamId));

  @JsonKey(ignore: true)
  @override
  _$BoardModelCopyWith<_BoardModel> get copyWith =>
      __$BoardModelCopyWithImpl<_BoardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoardModelToJson(this);
  }
}

abstract class _BoardModel extends BoardModel {
  factory _BoardModel(
      {@JsonKey(name: "analyticsFreePersons") int? analyticsPeopleBank,
      @JsonKey(name: "developmentFreePersons") int? developmentPeopleBank,
      @JsonKey(name: "testFreePersons") int? testingPeopleBank,
      int? day,
      List<CardModel>? cards,
      int? teamId}) = _$_BoardModel;
  _BoardModel._() : super._();

  factory _BoardModel.fromJson(Map<String, dynamic> json) =
      _$_BoardModel.fromJson;

  @override
  @JsonKey(name: "analyticsFreePersons")
  int? get analyticsPeopleBank;
  @override
  @JsonKey(name: "developmentFreePersons")
  int? get developmentPeopleBank;
  @override
  @JsonKey(name: "testFreePersons")
  int? get testingPeopleBank;
  @override
  int? get day;
  @override
  List<CardModel>? get cards;
  @override
  int? get teamId;
  @override
  @JsonKey(ignore: true)
  _$BoardModelCopyWith<_BoardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
