// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Students {
  @JsonKey(name: "attendance_id")
  dynamic get attendanceId;
  @JsonKey(name: "unq_id")
  dynamic get unqId;
  @JsonKey(name: "teacher_id")
  dynamic get teacherId;
  @JsonKey(name: "class_id")
  String get classId;
  @JsonKey(name: "section_id")
  dynamic get sectionId;
  @JsonKey(name: "subject_id")
  dynamic get subjectId;
  @JsonKey(name: "date")
  dynamic get date;
  @JsonKey(name: "student_id")
  String get studentId;
  @JsonKey(name: "attendance_status")
  dynamic get attendanceStatus;
  @JsonKey(name: "only_date")
  dynamic get onlyDate;
  @JsonKey(name: "academic_yr")
  dynamic get academicYr;
  @JsonKey(name: "first_name")
  String get firstName;
  @JsonKey(name: "last_name")
  String get lastName;
  @JsonKey(name: "roll_no")
  dynamic get rollNo;
  @JsonKey(name: "mark_attendance")
  String get markAttendance;
  @JsonKey(name: "Delete_btn")
  String get deleteBtn;

  /// Create a copy of Students
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StudentsCopyWith<Students> get copyWith =>
      _$StudentsCopyWithImpl<Students>(this as Students, _$identity);

  /// Serializes this Students to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Students &&
            const DeepCollectionEquality()
                .equals(other.attendanceId, attendanceId) &&
            const DeepCollectionEquality().equals(other.unqId, unqId) &&
            const DeepCollectionEquality().equals(other.teacherId, teacherId) &&
            (identical(other.classId, classId) || other.classId == classId) &&
            const DeepCollectionEquality().equals(other.sectionId, sectionId) &&
            const DeepCollectionEquality().equals(other.subjectId, subjectId) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            const DeepCollectionEquality()
                .equals(other.attendanceStatus, attendanceStatus) &&
            const DeepCollectionEquality().equals(other.onlyDate, onlyDate) &&
            const DeepCollectionEquality()
                .equals(other.academicYr, academicYr) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            const DeepCollectionEquality().equals(other.rollNo, rollNo) &&
            (identical(other.markAttendance, markAttendance) ||
                other.markAttendance == markAttendance) &&
            (identical(other.deleteBtn, deleteBtn) ||
                other.deleteBtn == deleteBtn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(attendanceId),
      const DeepCollectionEquality().hash(unqId),
      const DeepCollectionEquality().hash(teacherId),
      classId,
      const DeepCollectionEquality().hash(sectionId),
      const DeepCollectionEquality().hash(subjectId),
      const DeepCollectionEquality().hash(date),
      studentId,
      const DeepCollectionEquality().hash(attendanceStatus),
      const DeepCollectionEquality().hash(onlyDate),
      const DeepCollectionEquality().hash(academicYr),
      firstName,
      lastName,
      const DeepCollectionEquality().hash(rollNo),
      markAttendance,
      deleteBtn);

  @override
  String toString() {
    return 'Students(attendanceId: $attendanceId, unqId: $unqId, teacherId: $teacherId, classId: $classId, sectionId: $sectionId, subjectId: $subjectId, date: $date, studentId: $studentId, attendanceStatus: $attendanceStatus, onlyDate: $onlyDate, academicYr: $academicYr, firstName: $firstName, lastName: $lastName, rollNo: $rollNo, markAttendance: $markAttendance, deleteBtn: $deleteBtn)';
  }
}

/// @nodoc
abstract mixin class $StudentsCopyWith<$Res> {
  factory $StudentsCopyWith(Students value, $Res Function(Students) _then) =
      _$StudentsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "attendance_id") dynamic attendanceId,
      @JsonKey(name: "unq_id") dynamic unqId,
      @JsonKey(name: "teacher_id") dynamic teacherId,
      @JsonKey(name: "class_id") String classId,
      @JsonKey(name: "section_id") dynamic sectionId,
      @JsonKey(name: "subject_id") dynamic subjectId,
      @JsonKey(name: "date") dynamic date,
      @JsonKey(name: "student_id") String studentId,
      @JsonKey(name: "attendance_status") dynamic attendanceStatus,
      @JsonKey(name: "only_date") dynamic onlyDate,
      @JsonKey(name: "academic_yr") dynamic academicYr,
      @JsonKey(name: "first_name") String firstName,
      @JsonKey(name: "last_name") String lastName,
      @JsonKey(name: "roll_no") dynamic rollNo,
      @JsonKey(name: "mark_attendance") String markAttendance,
      @JsonKey(name: "Delete_btn") String deleteBtn});
}

/// @nodoc
class _$StudentsCopyWithImpl<$Res> implements $StudentsCopyWith<$Res> {
  _$StudentsCopyWithImpl(this._self, this._then);

  final Students _self;
  final $Res Function(Students) _then;

  /// Create a copy of Students
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceId = freezed,
    Object? unqId = freezed,
    Object? teacherId = freezed,
    Object? classId = null,
    Object? sectionId = freezed,
    Object? subjectId = freezed,
    Object? date = freezed,
    Object? studentId = null,
    Object? attendanceStatus = freezed,
    Object? onlyDate = freezed,
    Object? academicYr = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? rollNo = freezed,
    Object? markAttendance = null,
    Object? deleteBtn = null,
  }) {
    return _then(_self.copyWith(
      attendanceId: freezed == attendanceId
          ? _self.attendanceId
          : attendanceId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      unqId: freezed == unqId
          ? _self.unqId
          : unqId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      teacherId: freezed == teacherId
          ? _self.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      classId: null == classId
          ? _self.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as String,
      sectionId: freezed == sectionId
          ? _self.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subjectId: freezed == subjectId
          ? _self.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as dynamic,
      studentId: null == studentId
          ? _self.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      attendanceStatus: freezed == attendanceStatus
          ? _self.attendanceStatus
          : attendanceStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      onlyDate: freezed == onlyDate
          ? _self.onlyDate
          : onlyDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      academicYr: freezed == academicYr
          ? _self.academicYr
          : academicYr // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      rollNo: freezed == rollNo
          ? _self.rollNo
          : rollNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      markAttendance: null == markAttendance
          ? _self.markAttendance
          : markAttendance // ignore: cast_nullable_to_non_nullable
              as String,
      deleteBtn: null == deleteBtn
          ? _self.deleteBtn
          : deleteBtn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Students implements Students {
  const _Students(
      {@JsonKey(name: "attendance_id") required this.attendanceId,
      @JsonKey(name: "unq_id") required this.unqId,
      @JsonKey(name: "teacher_id") required this.teacherId,
      @JsonKey(name: "class_id") required this.classId,
      @JsonKey(name: "section_id") required this.sectionId,
      @JsonKey(name: "subject_id") required this.subjectId,
      @JsonKey(name: "date") required this.date,
      @JsonKey(name: "student_id") required this.studentId,
      @JsonKey(name: "attendance_status") required this.attendanceStatus,
      @JsonKey(name: "only_date") required this.onlyDate,
      @JsonKey(name: "academic_yr") required this.academicYr,
      @JsonKey(name: "first_name") required this.firstName,
      @JsonKey(name: "last_name") required this.lastName,
      @JsonKey(name: "roll_no") required this.rollNo,
      @JsonKey(name: "mark_attendance") required this.markAttendance,
      @JsonKey(name: "Delete_btn") required this.deleteBtn});
  factory _Students.fromJson(Map<String, dynamic> json) =>
      _$StudentsFromJson(json);

  @override
  @JsonKey(name: "attendance_id")
  final dynamic attendanceId;
  @override
  @JsonKey(name: "unq_id")
  final dynamic unqId;
  @override
  @JsonKey(name: "teacher_id")
  final dynamic teacherId;
  @override
  @JsonKey(name: "class_id")
  final String classId;
  @override
  @JsonKey(name: "section_id")
  final dynamic sectionId;
  @override
  @JsonKey(name: "subject_id")
  final dynamic subjectId;
  @override
  @JsonKey(name: "date")
  final dynamic date;
  @override
  @JsonKey(name: "student_id")
  final String studentId;
  @override
  @JsonKey(name: "attendance_status")
  final dynamic attendanceStatus;
  @override
  @JsonKey(name: "only_date")
  final dynamic onlyDate;
  @override
  @JsonKey(name: "academic_yr")
  final dynamic academicYr;
  @override
  @JsonKey(name: "first_name")
  final String firstName;
  @override
  @JsonKey(name: "last_name")
  final String lastName;
  @override
  @JsonKey(name: "roll_no")
  final dynamic rollNo;
  @override
  @JsonKey(name: "mark_attendance")
  final String markAttendance;
  @override
  @JsonKey(name: "Delete_btn")
  final String deleteBtn;

  /// Create a copy of Students
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StudentsCopyWith<_Students> get copyWith =>
      __$StudentsCopyWithImpl<_Students>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StudentsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Students &&
            const DeepCollectionEquality()
                .equals(other.attendanceId, attendanceId) &&
            const DeepCollectionEquality().equals(other.unqId, unqId) &&
            const DeepCollectionEquality().equals(other.teacherId, teacherId) &&
            (identical(other.classId, classId) || other.classId == classId) &&
            const DeepCollectionEquality().equals(other.sectionId, sectionId) &&
            const DeepCollectionEquality().equals(other.subjectId, subjectId) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            const DeepCollectionEquality()
                .equals(other.attendanceStatus, attendanceStatus) &&
            const DeepCollectionEquality().equals(other.onlyDate, onlyDate) &&
            const DeepCollectionEquality()
                .equals(other.academicYr, academicYr) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            const DeepCollectionEquality().equals(other.rollNo, rollNo) &&
            (identical(other.markAttendance, markAttendance) ||
                other.markAttendance == markAttendance) &&
            (identical(other.deleteBtn, deleteBtn) ||
                other.deleteBtn == deleteBtn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(attendanceId),
      const DeepCollectionEquality().hash(unqId),
      const DeepCollectionEquality().hash(teacherId),
      classId,
      const DeepCollectionEquality().hash(sectionId),
      const DeepCollectionEquality().hash(subjectId),
      const DeepCollectionEquality().hash(date),
      studentId,
      const DeepCollectionEquality().hash(attendanceStatus),
      const DeepCollectionEquality().hash(onlyDate),
      const DeepCollectionEquality().hash(academicYr),
      firstName,
      lastName,
      const DeepCollectionEquality().hash(rollNo),
      markAttendance,
      deleteBtn);

  @override
  String toString() {
    return 'Students(attendanceId: $attendanceId, unqId: $unqId, teacherId: $teacherId, classId: $classId, sectionId: $sectionId, subjectId: $subjectId, date: $date, studentId: $studentId, attendanceStatus: $attendanceStatus, onlyDate: $onlyDate, academicYr: $academicYr, firstName: $firstName, lastName: $lastName, rollNo: $rollNo, markAttendance: $markAttendance, deleteBtn: $deleteBtn)';
  }
}

/// @nodoc
abstract mixin class _$StudentsCopyWith<$Res>
    implements $StudentsCopyWith<$Res> {
  factory _$StudentsCopyWith(_Students value, $Res Function(_Students) _then) =
      __$StudentsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "attendance_id") dynamic attendanceId,
      @JsonKey(name: "unq_id") dynamic unqId,
      @JsonKey(name: "teacher_id") dynamic teacherId,
      @JsonKey(name: "class_id") String classId,
      @JsonKey(name: "section_id") dynamic sectionId,
      @JsonKey(name: "subject_id") dynamic subjectId,
      @JsonKey(name: "date") dynamic date,
      @JsonKey(name: "student_id") String studentId,
      @JsonKey(name: "attendance_status") dynamic attendanceStatus,
      @JsonKey(name: "only_date") dynamic onlyDate,
      @JsonKey(name: "academic_yr") dynamic academicYr,
      @JsonKey(name: "first_name") String firstName,
      @JsonKey(name: "last_name") String lastName,
      @JsonKey(name: "roll_no") dynamic rollNo,
      @JsonKey(name: "mark_attendance") String markAttendance,
      @JsonKey(name: "Delete_btn") String deleteBtn});
}

/// @nodoc
class __$StudentsCopyWithImpl<$Res> implements _$StudentsCopyWith<$Res> {
  __$StudentsCopyWithImpl(this._self, this._then);

  final _Students _self;
  final $Res Function(_Students) _then;

  /// Create a copy of Students
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? attendanceId = freezed,
    Object? unqId = freezed,
    Object? teacherId = freezed,
    Object? classId = null,
    Object? sectionId = freezed,
    Object? subjectId = freezed,
    Object? date = freezed,
    Object? studentId = null,
    Object? attendanceStatus = freezed,
    Object? onlyDate = freezed,
    Object? academicYr = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? rollNo = freezed,
    Object? markAttendance = null,
    Object? deleteBtn = null,
  }) {
    return _then(_Students(
      attendanceId: freezed == attendanceId
          ? _self.attendanceId
          : attendanceId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      unqId: freezed == unqId
          ? _self.unqId
          : unqId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      teacherId: freezed == teacherId
          ? _self.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      classId: null == classId
          ? _self.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as String,
      sectionId: freezed == sectionId
          ? _self.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subjectId: freezed == subjectId
          ? _self.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as dynamic,
      studentId: null == studentId
          ? _self.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      attendanceStatus: freezed == attendanceStatus
          ? _self.attendanceStatus
          : attendanceStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      onlyDate: freezed == onlyDate
          ? _self.onlyDate
          : onlyDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      academicYr: freezed == academicYr
          ? _self.academicYr
          : academicYr // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      rollNo: freezed == rollNo
          ? _self.rollNo
          : rollNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      markAttendance: null == markAttendance
          ? _self.markAttendance
          : markAttendance // ignore: cast_nullable_to_non_nullable
              as String,
      deleteBtn: null == deleteBtn
          ? _self.deleteBtn
          : deleteBtn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
