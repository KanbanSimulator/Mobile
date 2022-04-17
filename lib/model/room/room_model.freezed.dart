// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) {
  return _RoomModel.fromJson(json);
}

/// @nodoc
class _$RoomModelTearOff {
  const _$RoomModelTearOff();

  _RoomModel call(
      {int? id,
      PlayerModel? player,
      List<PlayerModel>? players,
      bool? started,
      List<TeamDto>? teams}) {
    return _RoomModel(
      id: id,
      player: player,
      players: players,
      started: started,
      teams: teams,
    );
  }

  RoomModel fromJson(Map<String, Object?> json) {
    return RoomModel.fromJson(json);
  }
}

/// @nodoc
const $RoomModel = _$RoomModelTearOff();

/// @nodoc
mixin _$RoomModel {
  int? get id => throw _privateConstructorUsedError;
  PlayerModel? get player => throw _privateConstructorUsedError;
  List<PlayerModel>? get players => throw _privateConstructorUsedError;
  bool? get started => throw _privateConstructorUsedError;
  List<TeamDto>? get teams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomModelCopyWith<RoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomModelCopyWith<$Res> {
  factory $RoomModelCopyWith(RoomModel value, $Res Function(RoomModel) then) =
      _$RoomModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      PlayerModel? player,
      List<PlayerModel>? players,
      bool? started,
      List<TeamDto>? teams});

  $PlayerModelCopyWith<$Res>? get player;
}

/// @nodoc
class _$RoomModelCopyWithImpl<$Res> implements $RoomModelCopyWith<$Res> {
  _$RoomModelCopyWithImpl(this._value, this._then);

  final RoomModel _value;
  // ignore: unused_field
  final $Res Function(RoomModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? player = freezed,
    Object? players = freezed,
    Object? started = freezed,
    Object? teams = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as PlayerModel?,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerModel>?,
      started: started == freezed
          ? _value.started
          : started // ignore: cast_nullable_to_non_nullable
              as bool?,
      teams: teams == freezed
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamDto>?,
    ));
  }

  @override
  $PlayerModelCopyWith<$Res>? get player {
    if (_value.player == null) {
      return null;
    }

    return $PlayerModelCopyWith<$Res>(_value.player!, (value) {
      return _then(_value.copyWith(player: value));
    });
  }
}

/// @nodoc
abstract class _$RoomModelCopyWith<$Res> implements $RoomModelCopyWith<$Res> {
  factory _$RoomModelCopyWith(
          _RoomModel value, $Res Function(_RoomModel) then) =
      __$RoomModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      PlayerModel? player,
      List<PlayerModel>? players,
      bool? started,
      List<TeamDto>? teams});

  @override
  $PlayerModelCopyWith<$Res>? get player;
}

/// @nodoc
class __$RoomModelCopyWithImpl<$Res> extends _$RoomModelCopyWithImpl<$Res>
    implements _$RoomModelCopyWith<$Res> {
  __$RoomModelCopyWithImpl(_RoomModel _value, $Res Function(_RoomModel) _then)
      : super(_value, (v) => _then(v as _RoomModel));

  @override
  _RoomModel get _value => super._value as _RoomModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? player = freezed,
    Object? players = freezed,
    Object? started = freezed,
    Object? teams = freezed,
  }) {
    return _then(_RoomModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as PlayerModel?,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerModel>?,
      started: started == freezed
          ? _value.started
          : started // ignore: cast_nullable_to_non_nullable
              as bool?,
      teams: teams == freezed
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoomModel implements _RoomModel {
  _$_RoomModel({this.id, this.player, this.players, this.started, this.teams});

  factory _$_RoomModel.fromJson(Map<String, dynamic> json) =>
      _$$_RoomModelFromJson(json);

  @override
  final int? id;
  @override
  final PlayerModel? player;
  @override
  final List<PlayerModel>? players;
  @override
  final bool? started;
  @override
  final List<TeamDto>? teams;

  @override
  String toString() {
    return 'RoomModel(id: $id, player: $player, players: $players, started: $started, teams: $teams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoomModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.started, started) &&
            const DeepCollectionEquality().equals(other.teams, teams));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(started),
      const DeepCollectionEquality().hash(teams));

  @JsonKey(ignore: true)
  @override
  _$RoomModelCopyWith<_RoomModel> get copyWith =>
      __$RoomModelCopyWithImpl<_RoomModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoomModelToJson(this);
  }
}

abstract class _RoomModel implements RoomModel {
  factory _RoomModel(
      {int? id,
      PlayerModel? player,
      List<PlayerModel>? players,
      bool? started,
      List<TeamDto>? teams}) = _$_RoomModel;

  factory _RoomModel.fromJson(Map<String, dynamic> json) =
      _$_RoomModel.fromJson;

  @override
  int? get id;
  @override
  PlayerModel? get player;
  @override
  List<PlayerModel>? get players;
  @override
  bool? get started;
  @override
  List<TeamDto>? get teams;
  @override
  @JsonKey(ignore: true)
  _$RoomModelCopyWith<_RoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}
