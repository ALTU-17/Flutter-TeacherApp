// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeacherUser {
  @HiveField(0)
  @JsonKey(name: "teacher_verification")
  TeacherVerification? get teacherVerification;
  @HiveField(2)
  @JsonKey(name: "error")
  bool? get error;
  @HiveField(3)
  @JsonKey(name: "reg_id")
  String? get regId;
  @HiveField(4)
  @JsonKey(name: "password")
  String? get password;
  @HiveField(5)
  @JsonKey(name: "default_pwd")
  String? get defaultPwd;
  @HiveField(6)
  @JsonKey(name: "name")
  String? get name;
  @HiveField(7)
  @JsonKey(name: "user_id")
  String? get userId;
  @HiveField(8)
  @JsonKey(name: "role_id")
  String? get roleId;
  @HiveField(9)
  @JsonKey(name: "academic_yr")
  String? get academicYr;

  /// Create a copy of TeacherUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TeacherUserCopyWith<TeacherUser> get copyWith =>
      _$TeacherUserCopyWithImpl<TeacherUser>(this as TeacherUser, _$identity);

  /// Serializes this TeacherUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TeacherUser &&
            (identical(other.teacherVerification, teacherVerification) ||
                other.teacherVerification == teacherVerification) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.regId, regId) || other.regId == regId) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.defaultPwd, defaultPwd) ||
                other.defaultPwd == defaultPwd) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.academicYr, academicYr) ||
                other.academicYr == academicYr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, teacherVerification, error,
      regId, password, defaultPwd, name, userId, roleId, academicYr);

  @override
  String toString() {
    return 'TeacherUser(teacherVerification: $teacherVerification, error: $error, regId: $regId, password: $password, defaultPwd: $defaultPwd, name: $name, userId: $userId, roleId: $roleId, academicYr: $academicYr)';
  }
}

/// @nodoc
abstract mixin class $TeacherUserCopyWith<$Res> {
  factory $TeacherUserCopyWith(
          TeacherUser value, $Res Function(TeacherUser) _then) =
      _$TeacherUserCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0)
      @JsonKey(name: "teacher_verification")
      TeacherVerification? teacherVerification,
      @HiveField(2) @JsonKey(name: "error") bool? error,
      @HiveField(3) @JsonKey(name: "reg_id") String? regId,
      @HiveField(4) @JsonKey(name: "password") String? password,
      @HiveField(5) @JsonKey(name: "default_pwd") String? defaultPwd,
      @HiveField(6) @JsonKey(name: "name") String? name,
      @HiveField(7) @JsonKey(name: "user_id") String? userId,
      @HiveField(8) @JsonKey(name: "role_id") String? roleId,
      @HiveField(9) @JsonKey(name: "academic_yr") String? academicYr});

  $TeacherVerificationCopyWith<$Res>? get teacherVerification;
}

/// @nodoc
class _$TeacherUserCopyWithImpl<$Res> implements $TeacherUserCopyWith<$Res> {
  _$TeacherUserCopyWithImpl(this._self, this._then);

  final TeacherUser _self;
  final $Res Function(TeacherUser) _then;

  /// Create a copy of TeacherUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherVerification = freezed,
    Object? error = freezed,
    Object? regId = freezed,
    Object? password = freezed,
    Object? defaultPwd = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? roleId = freezed,
    Object? academicYr = freezed,
  }) {
    return _then(_self.copyWith(
      teacherVerification: freezed == teacherVerification
          ? _self.teacherVerification
          : teacherVerification // ignore: cast_nullable_to_non_nullable
              as TeacherVerification?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      regId: freezed == regId
          ? _self.regId
          : regId // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultPwd: freezed == defaultPwd
          ? _self.defaultPwd
          : defaultPwd // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as String?,
      academicYr: freezed == academicYr
          ? _self.academicYr
          : academicYr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of TeacherUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeacherVerificationCopyWith<$Res>? get teacherVerification {
    if (_self.teacherVerification == null) {
      return null;
    }

    return $TeacherVerificationCopyWith<$Res>(_self.teacherVerification!,
        (value) {
      return _then(_self.copyWith(teacherVerification: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'TeacherUserAdapter')
class _TeacherUser implements TeacherUser {
  const _TeacherUser(
      {@HiveField(0)
      @JsonKey(name: "teacher_verification")
      this.teacherVerification,
      @HiveField(2) @JsonKey(name: "error") this.error,
      @HiveField(3) @JsonKey(name: "reg_id") this.regId,
      @HiveField(4) @JsonKey(name: "password") this.password,
      @HiveField(5) @JsonKey(name: "default_pwd") this.defaultPwd,
      @HiveField(6) @JsonKey(name: "name") this.name,
      @HiveField(7) @JsonKey(name: "user_id") this.userId,
      @HiveField(8) @JsonKey(name: "role_id") this.roleId,
      @HiveField(9) @JsonKey(name: "academic_yr") this.academicYr});
  factory _TeacherUser.fromJson(Map<String, dynamic> json) =>
      _$TeacherUserFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "teacher_verification")
  final TeacherVerification? teacherVerification;
  @override
  @HiveField(2)
  @JsonKey(name: "error")
  final bool? error;
  @override
  @HiveField(3)
  @JsonKey(name: "reg_id")
  final String? regId;
  @override
  @HiveField(4)
  @JsonKey(name: "password")
  final String? password;
  @override
  @HiveField(5)
  @JsonKey(name: "default_pwd")
  final String? defaultPwd;
  @override
  @HiveField(6)
  @JsonKey(name: "name")
  final String? name;
  @override
  @HiveField(7)
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @HiveField(8)
  @JsonKey(name: "role_id")
  final String? roleId;
  @override
  @HiveField(9)
  @JsonKey(name: "academic_yr")
  final String? academicYr;

  /// Create a copy of TeacherUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TeacherUserCopyWith<_TeacherUser> get copyWith =>
      __$TeacherUserCopyWithImpl<_TeacherUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TeacherUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TeacherUser &&
            (identical(other.teacherVerification, teacherVerification) ||
                other.teacherVerification == teacherVerification) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.regId, regId) || other.regId == regId) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.defaultPwd, defaultPwd) ||
                other.defaultPwd == defaultPwd) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.academicYr, academicYr) ||
                other.academicYr == academicYr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, teacherVerification, error,
      regId, password, defaultPwd, name, userId, roleId, academicYr);

  @override
  String toString() {
    return 'TeacherUser(teacherVerification: $teacherVerification, error: $error, regId: $regId, password: $password, defaultPwd: $defaultPwd, name: $name, userId: $userId, roleId: $roleId, academicYr: $academicYr)';
  }
}

/// @nodoc
abstract mixin class _$TeacherUserCopyWith<$Res>
    implements $TeacherUserCopyWith<$Res> {
  factory _$TeacherUserCopyWith(
          _TeacherUser value, $Res Function(_TeacherUser) _then) =
      __$TeacherUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0)
      @JsonKey(name: "teacher_verification")
      TeacherVerification? teacherVerification,
      @HiveField(2) @JsonKey(name: "error") bool? error,
      @HiveField(3) @JsonKey(name: "reg_id") String? regId,
      @HiveField(4) @JsonKey(name: "password") String? password,
      @HiveField(5) @JsonKey(name: "default_pwd") String? defaultPwd,
      @HiveField(6) @JsonKey(name: "name") String? name,
      @HiveField(7) @JsonKey(name: "user_id") String? userId,
      @HiveField(8) @JsonKey(name: "role_id") String? roleId,
      @HiveField(9) @JsonKey(name: "academic_yr") String? academicYr});

  @override
  $TeacherVerificationCopyWith<$Res>? get teacherVerification;
}

/// @nodoc
class __$TeacherUserCopyWithImpl<$Res> implements _$TeacherUserCopyWith<$Res> {
  __$TeacherUserCopyWithImpl(this._self, this._then);

  final _TeacherUser _self;
  final $Res Function(_TeacherUser) _then;

  /// Create a copy of TeacherUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? teacherVerification = freezed,
    Object? error = freezed,
    Object? regId = freezed,
    Object? password = freezed,
    Object? defaultPwd = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? roleId = freezed,
    Object? academicYr = freezed,
  }) {
    return _then(_TeacherUser(
      teacherVerification: freezed == teacherVerification
          ? _self.teacherVerification
          : teacherVerification // ignore: cast_nullable_to_non_nullable
              as TeacherVerification?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      regId: freezed == regId
          ? _self.regId
          : regId // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultPwd: freezed == defaultPwd
          ? _self.defaultPwd
          : defaultPwd // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as String?,
      academicYr: freezed == academicYr
          ? _self.academicYr
          : academicYr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of TeacherUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeacherVerificationCopyWith<$Res>? get teacherVerification {
    if (_self.teacherVerification == null) {
      return null;
    }

    return $TeacherVerificationCopyWith<$Res>(_self.teacherVerification!,
        (value) {
      return _then(_self.copyWith(teacherVerification: value));
    });
  }
}

// dart format on
