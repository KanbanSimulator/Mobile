// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TaskCardModelTearOff {
  const _$TaskCardModelTearOff();

  _TaskCardModel call(
      {String? title,
      List<String>? progress,
      int? value,
      int? stage,
      List<int>? peopleCount}) {
    return _TaskCardModel(
      title: title,
      progress: progress,
      value: value,
      stage: stage,
      peopleCount: peopleCount,
    );
  }
}

/// @nodoc
const $TaskCardModel = _$TaskCardModelTearOff();

/// @nodoc
mixin _$TaskCardModel {
  String? get title => throw _privateConstructorUsedError;
  List<String>? get progress =>
      throw _privateConstructorUsedError; // list of progresses
  int? get value => throw _privateConstructorUsedError;
  int? get stage => throw _privateConstructorUsedError;
  List<int>? get peopleCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCardModelCopyWith<TaskCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCardModelCopyWith<$Res> {
  factory $TaskCardModelCopyWith(
          TaskCardModel value, $Res Function(TaskCardModel) then) =
      _$TaskCardModelCopyWithImpl<$Res>;
  $Res call(
      {String? title,
      List<String>? progress,
      int? value,
      int? stage,
      List<int>? peopleCount});
}

/// @nodoc
class _$TaskCardModelCopyWithImpl<$Res>
    implements $TaskCardModelCopyWith<$Res> {
  _$TaskCardModelCopyWithImpl(this._value, this._then);

  final TaskCardModel _value;
  // ignore: unused_field
  final $Res Function(TaskCardModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? progress = freezed,
    Object? value = freezed,
    Object? stage = freezed,
    Object? peopleCount = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      stage: stage == freezed
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int?,
      peopleCount: peopleCount == freezed
          ? _value.peopleCount
          : peopleCount // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
abstract class _$TaskCardModelCopyWith<$Res>
    implements $TaskCardModelCopyWith<$Res> {
  factory _$TaskCardModelCopyWith(
          _TaskCardModel value, $Res Function(_TaskCardModel) then) =
      __$TaskCardModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? title,
      List<String>? progress,
      int? value,
      int? stage,
      List<int>? peopleCount});
}

/// @nodoc
class __$TaskCardModelCopyWithImpl<$Res>
    extends _$TaskCardModelCopyWithImpl<$Res>
    implements _$TaskCardModelCopyWith<$Res> {
  __$TaskCardModelCopyWithImpl(
      _TaskCardModel _value, $Res Function(_TaskCardModel) _then)
      : super(_value, (v) => _then(v as _TaskCardModel));

  @override
  _TaskCardModel get _value => super._value as _TaskCardModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? progress = freezed,
    Object? value = freezed,
    Object? stage = freezed,
    Object? peopleCount = freezed,
  }) {
    return _then(_TaskCardModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      stage: stage == freezed
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int?,
      peopleCount: peopleCount == freezed
          ? _value.peopleCount
          : peopleCount // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc

class _$_TaskCardModel implements _TaskCardModel {
  _$_TaskCardModel(
      {this.title, this.progress, this.value, this.stage, this.peopleCount});

  @override
  final String? title;
  @override
  final List<String>? progress;
  @override // list of progresses
  final int? value;
  @override
  final int? stage;
  @override
  final List<int>? peopleCount;

  @override
  String toString() {
    return 'TaskCardModel(title: $title, progress: $progress, value: $value, stage: $stage, peopleCount: $peopleCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskCardModel &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.progress, progress) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.stage, stage) &&
            const DeepCollectionEquality()
                .equals(other.peopleCount, peopleCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(progress),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(stage),
      const DeepCollectionEquality().hash(peopleCount));

  @JsonKey(ignore: true)
  @override
  _$TaskCardModelCopyWith<_TaskCardModel> get copyWith =>
      __$TaskCardModelCopyWithImpl<_TaskCardModel>(this, _$identity);
}

abstract class _TaskCardModel implements TaskCardModel {
  factory _TaskCardModel(
      {String? title,
      List<String>? progress,
      int? value,
      int? stage,
      List<int>? peopleCount}) = _$_TaskCardModel;

  @override
  String? get title;
  @override
  List<String>? get progress;
  @override // list of progresses
  int? get value;
  @override
  int? get stage;
  @override
  List<int>? get peopleCount;
  @override
  @JsonKey(ignore: true)
  _$TaskCardModelCopyWith<_TaskCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
