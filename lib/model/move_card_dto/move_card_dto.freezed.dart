// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'move_card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoveCardDto _$MoveCardDtoFromJson(Map<String, dynamic> json) {
  return _MoveCardDto.fromJson(json);
}

/// @nodoc
class _$MoveCardDtoTearOff {
  const _$MoveCardDtoTearOff();

  _MoveCardDto call({int? cardId, int? ordering, int? columnNumber}) {
    return _MoveCardDto(
      cardId: cardId,
      ordering: ordering,
      columnNumber: columnNumber,
    );
  }

  MoveCardDto fromJson(Map<String, Object?> json) {
    return MoveCardDto.fromJson(json);
  }
}

/// @nodoc
const $MoveCardDto = _$MoveCardDtoTearOff();

/// @nodoc
mixin _$MoveCardDto {
  int? get cardId => throw _privateConstructorUsedError;
  int? get ordering => throw _privateConstructorUsedError;
  int? get columnNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoveCardDtoCopyWith<MoveCardDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoveCardDtoCopyWith<$Res> {
  factory $MoveCardDtoCopyWith(
          MoveCardDto value, $Res Function(MoveCardDto) then) =
      _$MoveCardDtoCopyWithImpl<$Res>;
  $Res call({int? cardId, int? ordering, int? columnNumber});
}

/// @nodoc
class _$MoveCardDtoCopyWithImpl<$Res> implements $MoveCardDtoCopyWith<$Res> {
  _$MoveCardDtoCopyWithImpl(this._value, this._then);

  final MoveCardDto _value;
  // ignore: unused_field
  final $Res Function(MoveCardDto) _then;

  @override
  $Res call({
    Object? cardId = freezed,
    Object? ordering = freezed,
    Object? columnNumber = freezed,
  }) {
    return _then(_value.copyWith(
      cardId: cardId == freezed
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int?,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as int?,
      columnNumber: columnNumber == freezed
          ? _value.columnNumber
          : columnNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$MoveCardDtoCopyWith<$Res>
    implements $MoveCardDtoCopyWith<$Res> {
  factory _$MoveCardDtoCopyWith(
          _MoveCardDto value, $Res Function(_MoveCardDto) then) =
      __$MoveCardDtoCopyWithImpl<$Res>;
  @override
  $Res call({int? cardId, int? ordering, int? columnNumber});
}

/// @nodoc
class __$MoveCardDtoCopyWithImpl<$Res> extends _$MoveCardDtoCopyWithImpl<$Res>
    implements _$MoveCardDtoCopyWith<$Res> {
  __$MoveCardDtoCopyWithImpl(
      _MoveCardDto _value, $Res Function(_MoveCardDto) _then)
      : super(_value, (v) => _then(v as _MoveCardDto));

  @override
  _MoveCardDto get _value => super._value as _MoveCardDto;

  @override
  $Res call({
    Object? cardId = freezed,
    Object? ordering = freezed,
    Object? columnNumber = freezed,
  }) {
    return _then(_MoveCardDto(
      cardId: cardId == freezed
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int?,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as int?,
      columnNumber: columnNumber == freezed
          ? _value.columnNumber
          : columnNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoveCardDto extends _MoveCardDto {
  _$_MoveCardDto({this.cardId, this.ordering, this.columnNumber}) : super._();

  factory _$_MoveCardDto.fromJson(Map<String, dynamic> json) =>
      _$$_MoveCardDtoFromJson(json);

  @override
  final int? cardId;
  @override
  final int? ordering;
  @override
  final int? columnNumber;

  @override
  String toString() {
    return 'MoveCardDto(cardId: $cardId, ordering: $ordering, columnNumber: $columnNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MoveCardDto &&
            const DeepCollectionEquality().equals(other.cardId, cardId) &&
            const DeepCollectionEquality().equals(other.ordering, ordering) &&
            const DeepCollectionEquality()
                .equals(other.columnNumber, columnNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cardId),
      const DeepCollectionEquality().hash(ordering),
      const DeepCollectionEquality().hash(columnNumber));

  @JsonKey(ignore: true)
  @override
  _$MoveCardDtoCopyWith<_MoveCardDto> get copyWith =>
      __$MoveCardDtoCopyWithImpl<_MoveCardDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoveCardDtoToJson(this);
  }
}

abstract class _MoveCardDto extends MoveCardDto {
  factory _MoveCardDto({int? cardId, int? ordering, int? columnNumber}) =
      _$_MoveCardDto;
  _MoveCardDto._() : super._();

  factory _MoveCardDto.fromJson(Map<String, dynamic> json) =
      _$_MoveCardDto.fromJson;

  @override
  int? get cardId;
  @override
  int? get ordering;
  @override
  int? get columnNumber;
  @override
  @JsonKey(ignore: true)
  _$MoveCardDtoCopyWith<_MoveCardDto> get copyWith =>
      throw _privateConstructorUsedError;
}
