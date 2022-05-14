// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TaskModelTearOff {
  const _$TaskModelTearOff();

  _TaskModel call(
      {int? id,
      String? title,
      List<String>? progress,
      int? value,
      int? stage,
      int? peopleCount,
      int? blockerCompleted,
      int? blockerRemaining,
      bool? isExpedite}) {
    return _TaskModel(
      id: id,
      title: title,
      progress: progress,
      value: value,
      stage: stage,
      peopleCount: peopleCount,
      blockerCompleted: blockerCompleted,
      blockerRemaining: blockerRemaining,
      isExpedite: isExpedite,
    );
  }
}

/// @nodoc
const $TaskModel = _$TaskModelTearOff();

/// @nodoc
mixin _$TaskModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<String>? get progress =>
      throw _privateConstructorUsedError; // list of progresses
  int? get value => throw _privateConstructorUsedError;
  int? get stage => throw _privateConstructorUsedError;
  int? get peopleCount =>
      throw _privateConstructorUsedError; // list of people on each stage
  int? get blockerCompleted => throw _privateConstructorUsedError;
  int? get blockerRemaining => throw _privateConstructorUsedError;
  bool? get isExpedite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? title,
      List<String>? progress,
      int? value,
      int? stage,
      int? peopleCount,
      int? blockerCompleted,
      int? blockerRemaining,
      bool? isExpedite});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res> implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  final TaskModel _value;
  // ignore: unused_field
  final $Res Function(TaskModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? progress = freezed,
    Object? value = freezed,
    Object? stage = freezed,
    Object? peopleCount = freezed,
    Object? blockerCompleted = freezed,
    Object? blockerRemaining = freezed,
    Object? isExpedite = freezed,
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
      blockerCompleted: blockerCompleted == freezed
          ? _value.blockerCompleted
          : blockerCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      blockerRemaining: blockerRemaining == freezed
          ? _value.blockerRemaining
          : blockerRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
      isExpedite: isExpedite == freezed
          ? _value.isExpedite
          : isExpedite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$TaskModelCopyWith(
          _TaskModel value, $Res Function(_TaskModel) then) =
      __$TaskModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? title,
      List<String>? progress,
      int? value,
      int? stage,
      int? peopleCount,
      int? blockerCompleted,
      int? blockerRemaining,
      bool? isExpedite});
}

/// @nodoc
class __$TaskModelCopyWithImpl<$Res> extends _$TaskModelCopyWithImpl<$Res>
    implements _$TaskModelCopyWith<$Res> {
  __$TaskModelCopyWithImpl(_TaskModel _value, $Res Function(_TaskModel) _then)
      : super(_value, (v) => _then(v as _TaskModel));

  @override
  _TaskModel get _value => super._value as _TaskModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? progress = freezed,
    Object? value = freezed,
    Object? stage = freezed,
    Object? peopleCount = freezed,
    Object? blockerCompleted = freezed,
    Object? blockerRemaining = freezed,
    Object? isExpedite = freezed,
  }) {
    return _then(_TaskModel(
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
      blockerCompleted: blockerCompleted == freezed
          ? _value.blockerCompleted
          : blockerCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      blockerRemaining: blockerRemaining == freezed
          ? _value.blockerRemaining
          : blockerRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
      isExpedite: isExpedite == freezed
          ? _value.isExpedite
          : isExpedite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_TaskModel extends _TaskModel {
  _$_TaskModel(
      {this.id,
      this.title,
      this.progress,
      this.value,
      this.stage,
      this.peopleCount,
      this.blockerCompleted,
      this.blockerRemaining,
      this.isExpedite})
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
  final int? blockerCompleted;
  @override
  final int? blockerRemaining;
  @override
  final bool? isExpedite;

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, progress: $progress, value: $value, stage: $stage, peopleCount: $peopleCount, blockerCompleted: $blockerCompleted, blockerRemaining: $blockerRemaining, isExpedite: $isExpedite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.progress, progress) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.stage, stage) &&
            const DeepCollectionEquality()
                .equals(other.peopleCount, peopleCount) &&
            const DeepCollectionEquality()
                .equals(other.blockerCompleted, blockerCompleted) &&
            const DeepCollectionEquality()
                .equals(other.blockerRemaining, blockerRemaining) &&
            const DeepCollectionEquality()
                .equals(other.isExpedite, isExpedite));
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
      const DeepCollectionEquality().hash(blockerCompleted),
      const DeepCollectionEquality().hash(blockerRemaining),
      const DeepCollectionEquality().hash(isExpedite));

  @JsonKey(ignore: true)
  @override
  _$TaskModelCopyWith<_TaskModel> get copyWith =>
      __$TaskModelCopyWithImpl<_TaskModel>(this, _$identity);
}

abstract class _TaskModel extends TaskModel {
  factory _TaskModel(
      {int? id,
      String? title,
      List<String>? progress,
      int? value,
      int? stage,
      int? peopleCount,
      int? blockerCompleted,
      int? blockerRemaining,
      bool? isExpedite}) = _$_TaskModel;
  _TaskModel._() : super._();

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
  int? get blockerCompleted;
  @override
  int? get blockerRemaining;
  @override
  bool? get isExpedite;
  @override
  @JsonKey(ignore: true)
  _$TaskModelCopyWith<_TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
