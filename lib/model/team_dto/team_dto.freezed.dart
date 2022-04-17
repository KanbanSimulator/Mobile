// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'team_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamDto _$TeamDtoFromJson(Map<String, dynamic> json) {
  return _TeamDto.fromJson(json);
}

/// @nodoc
class _$TeamDtoTearOff {
  const _$TeamDtoTearOff();

  _TeamDto call({int? teamId, int? teamNumber}) {
    return _TeamDto(
      teamId: teamId,
      teamNumber: teamNumber,
    );
  }

  TeamDto fromJson(Map<String, Object?> json) {
    return TeamDto.fromJson(json);
  }
}

/// @nodoc
const $TeamDto = _$TeamDtoTearOff();

/// @nodoc
mixin _$TeamDto {
  int? get teamId => throw _privateConstructorUsedError;
  int? get teamNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamDtoCopyWith<TeamDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamDtoCopyWith<$Res> {
  factory $TeamDtoCopyWith(TeamDto value, $Res Function(TeamDto) then) =
      _$TeamDtoCopyWithImpl<$Res>;
  $Res call({int? teamId, int? teamNumber});
}

/// @nodoc
class _$TeamDtoCopyWithImpl<$Res> implements $TeamDtoCopyWith<$Res> {
  _$TeamDtoCopyWithImpl(this._value, this._then);

  final TeamDto _value;
  // ignore: unused_field
  final $Res Function(TeamDto) _then;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? teamNumber = freezed,
  }) {
    return _then(_value.copyWith(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int?,
      teamNumber: teamNumber == freezed
          ? _value.teamNumber
          : teamNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$TeamDtoCopyWith<$Res> implements $TeamDtoCopyWith<$Res> {
  factory _$TeamDtoCopyWith(_TeamDto value, $Res Function(_TeamDto) then) =
      __$TeamDtoCopyWithImpl<$Res>;
  @override
  $Res call({int? teamId, int? teamNumber});
}

/// @nodoc
class __$TeamDtoCopyWithImpl<$Res> extends _$TeamDtoCopyWithImpl<$Res>
    implements _$TeamDtoCopyWith<$Res> {
  __$TeamDtoCopyWithImpl(_TeamDto _value, $Res Function(_TeamDto) _then)
      : super(_value, (v) => _then(v as _TeamDto));

  @override
  _TeamDto get _value => super._value as _TeamDto;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? teamNumber = freezed,
  }) {
    return _then(_TeamDto(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int?,
      teamNumber: teamNumber == freezed
          ? _value.teamNumber
          : teamNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeamDto implements _TeamDto {
  _$_TeamDto({this.teamId, this.teamNumber});

  factory _$_TeamDto.fromJson(Map<String, dynamic> json) =>
      _$$_TeamDtoFromJson(json);

  @override
  final int? teamId;
  @override
  final int? teamNumber;

  @override
  String toString() {
    return 'TeamDto(teamId: $teamId, teamNumber: $teamNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TeamDto &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality()
                .equals(other.teamNumber, teamNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(teamNumber));

  @JsonKey(ignore: true)
  @override
  _$TeamDtoCopyWith<_TeamDto> get copyWith =>
      __$TeamDtoCopyWithImpl<_TeamDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamDtoToJson(this);
  }
}

abstract class _TeamDto implements TeamDto {
  factory _TeamDto({int? teamId, int? teamNumber}) = _$_TeamDto;

  factory _TeamDto.fromJson(Map<String, dynamic> json) = _$_TeamDto.fromJson;

  @override
  int? get teamId;
  @override
  int? get teamNumber;
  @override
  @JsonKey(ignore: true)
  _$TeamDtoCopyWith<_TeamDto> get copyWith =>
      throw _privateConstructorUsedError;
}
