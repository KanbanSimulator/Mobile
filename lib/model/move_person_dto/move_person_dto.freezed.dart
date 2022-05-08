// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'move_person_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovePersonDto _$MovePersonDtoFromJson(Map<String, dynamic> json) {
  return _MovePersonDto.fromJson(json);
}

/// @nodoc
class _$MovePersonDtoTearOff {
  const _$MovePersonDtoTearOff();

  _MovePersonDto call({int? prevCard, int? currentCard}) {
    return _MovePersonDto(
      prevCard: prevCard,
      currentCard: currentCard,
    );
  }

  MovePersonDto fromJson(Map<String, Object?> json) {
    return MovePersonDto.fromJson(json);
  }
}

/// @nodoc
const $MovePersonDto = _$MovePersonDtoTearOff();

/// @nodoc
mixin _$MovePersonDto {
  int? get prevCard => throw _privateConstructorUsedError;
  int? get currentCard => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovePersonDtoCopyWith<MovePersonDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovePersonDtoCopyWith<$Res> {
  factory $MovePersonDtoCopyWith(
          MovePersonDto value, $Res Function(MovePersonDto) then) =
      _$MovePersonDtoCopyWithImpl<$Res>;
  $Res call({int? prevCard, int? currentCard});
}

/// @nodoc
class _$MovePersonDtoCopyWithImpl<$Res>
    implements $MovePersonDtoCopyWith<$Res> {
  _$MovePersonDtoCopyWithImpl(this._value, this._then);

  final MovePersonDto _value;
  // ignore: unused_field
  final $Res Function(MovePersonDto) _then;

  @override
  $Res call({
    Object? prevCard = freezed,
    Object? currentCard = freezed,
  }) {
    return _then(_value.copyWith(
      prevCard: prevCard == freezed
          ? _value.prevCard
          : prevCard // ignore: cast_nullable_to_non_nullable
              as int?,
      currentCard: currentCard == freezed
          ? _value.currentCard
          : currentCard // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$MovePersonDtoCopyWith<$Res>
    implements $MovePersonDtoCopyWith<$Res> {
  factory _$MovePersonDtoCopyWith(
          _MovePersonDto value, $Res Function(_MovePersonDto) then) =
      __$MovePersonDtoCopyWithImpl<$Res>;
  @override
  $Res call({int? prevCard, int? currentCard});
}

/// @nodoc
class __$MovePersonDtoCopyWithImpl<$Res>
    extends _$MovePersonDtoCopyWithImpl<$Res>
    implements _$MovePersonDtoCopyWith<$Res> {
  __$MovePersonDtoCopyWithImpl(
      _MovePersonDto _value, $Res Function(_MovePersonDto) _then)
      : super(_value, (v) => _then(v as _MovePersonDto));

  @override
  _MovePersonDto get _value => super._value as _MovePersonDto;

  @override
  $Res call({
    Object? prevCard = freezed,
    Object? currentCard = freezed,
  }) {
    return _then(_MovePersonDto(
      prevCard: prevCard == freezed
          ? _value.prevCard
          : prevCard // ignore: cast_nullable_to_non_nullable
              as int?,
      currentCard: currentCard == freezed
          ? _value.currentCard
          : currentCard // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovePersonDto extends _MovePersonDto {
  _$_MovePersonDto({this.prevCard, this.currentCard}) : super._();

  factory _$_MovePersonDto.fromJson(Map<String, dynamic> json) =>
      _$$_MovePersonDtoFromJson(json);

  @override
  final int? prevCard;
  @override
  final int? currentCard;

  @override
  String toString() {
    return 'MovePersonDto(prevCard: $prevCard, currentCard: $currentCard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovePersonDto &&
            const DeepCollectionEquality().equals(other.prevCard, prevCard) &&
            const DeepCollectionEquality()
                .equals(other.currentCard, currentCard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(prevCard),
      const DeepCollectionEquality().hash(currentCard));

  @JsonKey(ignore: true)
  @override
  _$MovePersonDtoCopyWith<_MovePersonDto> get copyWith =>
      __$MovePersonDtoCopyWithImpl<_MovePersonDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovePersonDtoToJson(this);
  }
}

abstract class _MovePersonDto extends MovePersonDto {
  factory _MovePersonDto({int? prevCard, int? currentCard}) = _$_MovePersonDto;
  _MovePersonDto._() : super._();

  factory _MovePersonDto.fromJson(Map<String, dynamic> json) =
      _$_MovePersonDto.fromJson;

  @override
  int? get prevCard;
  @override
  int? get currentCard;
  @override
  @JsonKey(ignore: true)
  _$MovePersonDtoCopyWith<_MovePersonDto> get copyWith =>
      throw _privateConstructorUsedError;
}
