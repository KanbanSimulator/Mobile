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
      {int? id,
      String? title,
      List<String>? progress,
      int? value,
      int? stage,
      int? peopleCount,
      int? inColumnIndex}) {
    return _TaskCardModel(
      id: id,
      title: title,
      progress: progress,
      value: value,
      stage: stage,
      peopleCount: peopleCount,
      inColumnIndex: inColumnIndex,
    );
  }
}

/// @nodoc
const $TaskCardModel = _$TaskCardModelTearOff();

/// @nodoc
mixin _$TaskCardModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<String>? get progress =>
      throw _privateConstructorUsedError; // list of progresses
  int? get value => throw _privateConstructorUsedError;
  int? get stage => throw _privateConstructorUsedError;
  int? get peopleCount =>
      throw _privateConstructorUsedError; // list of people on each stage
  int? get inColumnIndex => throw _privateConstructorUsedError;

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
      {int? id,
      String? title,
      List<String>? progress,
      int? value,
      int? stage,
      int? peopleCount,
      int? inColumnIndex});
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
    Object? id = freezed,
    Object? title = freezed,
    Object? progress = freezed,
    Object? value = freezed,
    Object? stage = freezed,
    Object? peopleCount = freezed,
    Object? inColumnIndex = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as int?,
      inColumnIndex: inColumnIndex == freezed
          ? _value.inColumnIndex
          : inColumnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {int? id,
      String? title,
      List<String>? progress,
      int? value,
      int? stage,
      int? peopleCount,
      int? inColumnIndex});
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
    Object? id = freezed,
    Object? title = freezed,
    Object? progress = freezed,
    Object? value = freezed,
    Object? stage = freezed,
    Object? peopleCount = freezed,
    Object? inColumnIndex = freezed,
  }) {
    return _then(_TaskCardModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as int?,
      inColumnIndex: inColumnIndex == freezed
          ? _value.inColumnIndex
          : inColumnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_TaskCardModel extends _TaskCardModel {
  _$_TaskCardModel(
      {this.id,
      this.title,
      this.progress,
      this.value,
      this.stage,
      this.peopleCount,
      this.inColumnIndex})
      : super._();

  @override
  final int? id;
  @override
  final String? title;
  @override
  final List<String>? progress;
  @override // list of progresses
  final int? value;
  @override
  final int? stage;
  @override
  final int? peopleCount;
  @override // list of people on each stage
  final int? inColumnIndex;

  @override
  String toString() {
    return 'TaskCardModel(id: $id, title: $title, progress: $progress, value: $value, stage: $stage, peopleCount: $peopleCount, inColumnIndex: $inColumnIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskCardModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.progress, progress) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.stage, stage) &&
            const DeepCollectionEquality()
                .equals(other.peopleCount, peopleCount) &&
            const DeepCollectionEquality()
                .equals(other.inColumnIndex, inColumnIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(progress),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(stage),
      const DeepCollectionEquality().hash(peopleCount),
      const DeepCollectionEquality().hash(inColumnIndex));

  @JsonKey(ignore: true)
  @override
  _$TaskCardModelCopyWith<_TaskCardModel> get copyWith =>
      __$TaskCardModelCopyWithImpl<_TaskCardModel>(this, _$identity);
}

abstract class _TaskCardModel extends TaskCardModel {
  factory _TaskCardModel(
      {int? id,
      String? title,
      List<String>? progress,
      int? value,
      int? stage,
      int? peopleCount,
      int? inColumnIndex}) = _$_TaskCardModel;
  _TaskCardModel._() : super._();

  @override
  int? get id;
  @override
  String? get title;
  @override
  List<String>? get progress;
  @override // list of progresses
  int? get value;
  @override
  int? get stage;
  @override
  int? get peopleCount;
  @override // list of people on each stage
  int? get inColumnIndex;
  @override
  @JsonKey(ignore: true)
  _$TaskCardModelCopyWith<_TaskCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
