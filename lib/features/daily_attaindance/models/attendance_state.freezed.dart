// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceState {
  List<Students> get students;
  List<ClassInfo> get classes;

  /// Create a copy of AttendanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AttendanceStateCopyWith<AttendanceState> get copyWith =>
      _$AttendanceStateCopyWithImpl<AttendanceState>(
          this as AttendanceState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AttendanceState &&
            const DeepCollectionEquality().equals(other.students, students) &&
            const DeepCollectionEquality().equals(other.classes, classes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(students),
      const DeepCollectionEquality().hash(classes));

  @override
  String toString() {
    return 'AttendanceState(students: $students, classes: $classes)';
  }
}

/// @nodoc
abstract mixin class $AttendanceStateCopyWith<$Res> {
  factory $AttendanceStateCopyWith(
          AttendanceState value, $Res Function(AttendanceState) _then) =
      _$AttendanceStateCopyWithImpl;
  @useResult
  $Res call({List<Students> students, List<ClassInfo> classes});
}

/// @nodoc
class _$AttendanceStateCopyWithImpl<$Res>
    implements $AttendanceStateCopyWith<$Res> {
  _$AttendanceStateCopyWithImpl(this._self, this._then);

  final AttendanceState _self;
  final $Res Function(AttendanceState) _then;

  /// Create a copy of AttendanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? students = null,
    Object? classes = null,
  }) {
    return _then(_self.copyWith(
      students: null == students
          ? _self.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Students>,
      classes: null == classes
          ? _self.classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassInfo>,
    ));
  }
}

/// @nodoc

class _AttendanceState implements AttendanceState {
  const _AttendanceState(
      {final List<Students> students = const [],
      final List<ClassInfo> classes = const []})
      : _students = students,
        _classes = classes;

  final List<Students> _students;
  @override
  @JsonKey()
  List<Students> get students {
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_students);
  }

  final List<ClassInfo> _classes;
  @override
  @JsonKey()
  List<ClassInfo> get classes {
    if (_classes is EqualUnmodifiableListView) return _classes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_classes);
  }

  /// Create a copy of AttendanceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AttendanceStateCopyWith<_AttendanceState> get copyWith =>
      __$AttendanceStateCopyWithImpl<_AttendanceState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AttendanceState &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            const DeepCollectionEquality().equals(other._classes, _classes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_students),
      const DeepCollectionEquality().hash(_classes));

  @override
  String toString() {
    return 'AttendanceState(students: $students, classes: $classes)';
  }
}

/// @nodoc
abstract mixin class _$AttendanceStateCopyWith<$Res>
    implements $AttendanceStateCopyWith<$Res> {
  factory _$AttendanceStateCopyWith(
          _AttendanceState value, $Res Function(_AttendanceState) _then) =
      __$AttendanceStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Students> students, List<ClassInfo> classes});
}

/// @nodoc
class __$AttendanceStateCopyWithImpl<$Res>
    implements _$AttendanceStateCopyWith<$Res> {
  __$AttendanceStateCopyWithImpl(this._self, this._then);

  final _AttendanceState _self;
  final $Res Function(_AttendanceState) _then;

  /// Create a copy of AttendanceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? students = null,
    Object? classes = null,
  }) {
    return _then(_AttendanceState(
      students: null == students
          ? _self._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Students>,
      classes: null == classes
          ? _self._classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassInfo>,
    ));
  }
}

// dart format on
