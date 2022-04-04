// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlayerModelTearOff {
  const _$PlayerModelTearOff();

  _PlayerModel call({int? id, bool? creator, String? name, int? teamNumber}) {
    return _PlayerModel(
      id: id,
      creator: creator,
      name: name,
      teamNumber: teamNumber,
    );
  }
}

/// @nodoc
const $PlayerModel = _$PlayerModelTearOff();

/// @nodoc
mixin _$PlayerModel {
  int? get id => throw _privateConstructorUsedError;
  bool? get creator => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get teamNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerModelCopyWith<PlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerModelCopyWith<$Res> {
  factory $PlayerModelCopyWith(
          PlayerModel value, $Res Function(PlayerModel) then) =
      _$PlayerModelCopyWithImpl<$Res>;
  $Res call({int? id, bool? creator, String? name, int? teamNumber});
}

/// @nodoc
class _$PlayerModelCopyWithImpl<$Res> implements $PlayerModelCopyWith<$Res> {
  _$PlayerModelCopyWithImpl(this._value, this._then);

  final PlayerModel _value;
  // ignore: unused_field
  final $Res Function(PlayerModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? creator = freezed,
    Object? name = freezed,
    Object? teamNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      teamNumber: teamNumber == freezed
          ? _value.teamNumber
          : teamNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$PlayerModelCopyWith<$Res>
    implements $PlayerModelCopyWith<$Res> {
  factory _$PlayerModelCopyWith(
          _PlayerModel value, $Res Function(_PlayerModel) then) =
      __$PlayerModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, bool? creator, String? name, int? teamNumber});
}

/// @nodoc
class __$PlayerModelCopyWithImpl<$Res> extends _$PlayerModelCopyWithImpl<$Res>
    implements _$PlayerModelCopyWith<$Res> {
  __$PlayerModelCopyWithImpl(
      _PlayerModel _value, $Res Function(_PlayerModel) _then)
      : super(_value, (v) => _then(v as _PlayerModel));

  @override
  _PlayerModel get _value => super._value as _PlayerModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? creator = freezed,
    Object? name = freezed,
    Object? teamNumber = freezed,
  }) {
    return _then(_PlayerModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      teamNumber: teamNumber == freezed
          ? _value.teamNumber
          : teamNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_PlayerModel implements _PlayerModel {
  _$_PlayerModel({this.id, this.creator, this.name, this.teamNumber});

  @override
  final int? id;
  @override
  final bool? creator;
  @override
  final String? name;
  @override
  final int? teamNumber;

  @override
  String toString() {
    return 'PlayerModel(id: $id, creator: $creator, name: $name, teamNumber: $teamNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayerModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.creator, creator) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.teamNumber, teamNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(creator),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(teamNumber));

  @JsonKey(ignore: true)
  @override
  _$PlayerModelCopyWith<_PlayerModel> get copyWith =>
      __$PlayerModelCopyWithImpl<_PlayerModel>(this, _$identity);
}

abstract class _PlayerModel implements PlayerModel {
  factory _PlayerModel(
      {int? id, bool? creator, String? name, int? teamNumber}) = _$_PlayerModel;

  @override
  int? get id;
  @override
  bool? get creator;
  @override
  String? get name;
  @override
  int? get teamNumber;
  @override
  @JsonKey(ignore: true)
  _$PlayerModelCopyWith<_PlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
