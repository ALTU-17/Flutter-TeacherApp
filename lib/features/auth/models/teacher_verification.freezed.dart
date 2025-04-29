// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_verification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeacherVerification {
  @HiveField(0)
  @JsonKey(name: "user_id")
  String get userId;
  @HiveField(1)
  @JsonKey(name: "school_id")
  String get schoolId;
  @HiveField(2)
  @JsonKey(name: "name")
  String get name;
  @HiveField(3)
  @JsonKey(name: "short_name")
  String get shortName;
  @HiveField(4)
  @JsonKey(name: "url")
  String get url;
  @HiveField(5)
  @JsonKey(name: "teacherapk_url")
  String get teacherapkUrl;
  @HiveField(6)
  @JsonKey(name: "project_url")
  String get projectUrl;
  @HiveField(7)
  @JsonKey(name: "default_password")
  String get defaultPassword;

  /// Create a copy of TeacherVerification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TeacherVerificationCopyWith<TeacherVerification> get copyWith =>
      _$TeacherVerificationCopyWithImpl<TeacherVerification>(
          this as TeacherVerification, _$identity);

  /// Serializes this TeacherVerification to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TeacherVerification &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.teacherapkUrl, teacherapkUrl) ||
                other.teacherapkUrl == teacherapkUrl) &&
            (identical(other.projectUrl, projectUrl) ||
                other.projectUrl == projectUrl) &&
            (identical(other.defaultPassword, defaultPassword) ||
                other.defaultPassword == defaultPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, schoolId, name,
      shortName, url, teacherapkUrl, projectUrl, defaultPassword);

  @override
  String toString() {
    return 'TeacherVerification(userId: $userId, schoolId: $schoolId, name: $name, shortName: $shortName, url: $url, teacherapkUrl: $teacherapkUrl, projectUrl: $projectUrl, defaultPassword: $defaultPassword)';
  }
}

/// @nodoc
abstract mixin class $TeacherVerificationCopyWith<$Res> {
  factory $TeacherVerificationCopyWith(
          TeacherVerification value, $Res Function(TeacherVerification) _then) =
      _$TeacherVerificationCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "user_id") String userId,
      @HiveField(1) @JsonKey(name: "school_id") String schoolId,
      @HiveField(2) @JsonKey(name: "name") String name,
      @HiveField(3) @JsonKey(name: "short_name") String shortName,
      @HiveField(4) @JsonKey(name: "url") String url,
      @HiveField(5) @JsonKey(name: "teacherapk_url") String teacherapkUrl,
      @HiveField(6) @JsonKey(name: "project_url") String projectUrl,
      @HiveField(7) @JsonKey(name: "default_password") String defaultPassword});
}

/// @nodoc
class _$TeacherVerificationCopyWithImpl<$Res>
    implements $TeacherVerificationCopyWith<$Res> {
  _$TeacherVerificationCopyWithImpl(this._self, this._then);

  final TeacherVerification _self;
  final $Res Function(TeacherVerification) _then;

  /// Create a copy of TeacherVerification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? schoolId = null,
    Object? name = null,
    Object? shortName = null,
    Object? url = null,
    Object? teacherapkUrl = null,
    Object? projectUrl = null,
    Object? defaultPassword = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      schoolId: null == schoolId
          ? _self.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      teacherapkUrl: null == teacherapkUrl
          ? _self.teacherapkUrl
          : teacherapkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      projectUrl: null == projectUrl
          ? _self.projectUrl
          : projectUrl // ignore: cast_nullable_to_non_nullable
              as String,
      defaultPassword: null == defaultPassword
          ? _self.defaultPassword
          : defaultPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'TeacherVerificationAdapter')
class _TeacherVerification implements TeacherVerification {
  const _TeacherVerification(
      {@HiveField(0) @JsonKey(name: "user_id") this.userId = "test",
      @HiveField(1) @JsonKey(name: "school_id") required this.schoolId,
      @HiveField(2) @JsonKey(name: "name") required this.name,
      @HiveField(3) @JsonKey(name: "short_name") required this.shortName,
      @HiveField(4) @JsonKey(name: "url") required this.url,
      @HiveField(5)
      @JsonKey(name: "teacherapk_url")
      required this.teacherapkUrl,
      @HiveField(6) @JsonKey(name: "project_url") required this.projectUrl,
      @HiveField(7)
      @JsonKey(name: "default_password")
      required this.defaultPassword});
  factory _TeacherVerification.fromJson(Map<String, dynamic> json) =>
      _$TeacherVerificationFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "user_id")
  final String userId;
  @override
  @HiveField(1)
  @JsonKey(name: "school_id")
  final String schoolId;
  @override
  @HiveField(2)
  @JsonKey(name: "name")
  final String name;
  @override
  @HiveField(3)
  @JsonKey(name: "short_name")
  final String shortName;
  @override
  @HiveField(4)
  @JsonKey(name: "url")
  final String url;
  @override
  @HiveField(5)
  @JsonKey(name: "teacherapk_url")
  final String teacherapkUrl;
  @override
  @HiveField(6)
  @JsonKey(name: "project_url")
  final String projectUrl;
  @override
  @HiveField(7)
  @JsonKey(name: "default_password")
  final String defaultPassword;

  /// Create a copy of TeacherVerification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TeacherVerificationCopyWith<_TeacherVerification> get copyWith =>
      __$TeacherVerificationCopyWithImpl<_TeacherVerification>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TeacherVerificationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TeacherVerification &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.teacherapkUrl, teacherapkUrl) ||
                other.teacherapkUrl == teacherapkUrl) &&
            (identical(other.projectUrl, projectUrl) ||
                other.projectUrl == projectUrl) &&
            (identical(other.defaultPassword, defaultPassword) ||
                other.defaultPassword == defaultPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, schoolId, name,
      shortName, url, teacherapkUrl, projectUrl, defaultPassword);

  @override
  String toString() {
    return 'TeacherVerification(userId: $userId, schoolId: $schoolId, name: $name, shortName: $shortName, url: $url, teacherapkUrl: $teacherapkUrl, projectUrl: $projectUrl, defaultPassword: $defaultPassword)';
  }
}

/// @nodoc
abstract mixin class _$TeacherVerificationCopyWith<$Res>
    implements $TeacherVerificationCopyWith<$Res> {
  factory _$TeacherVerificationCopyWith(_TeacherVerification value,
          $Res Function(_TeacherVerification) _then) =
      __$TeacherVerificationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "user_id") String userId,
      @HiveField(1) @JsonKey(name: "school_id") String schoolId,
      @HiveField(2) @JsonKey(name: "name") String name,
      @HiveField(3) @JsonKey(name: "short_name") String shortName,
      @HiveField(4) @JsonKey(name: "url") String url,
      @HiveField(5) @JsonKey(name: "teacherapk_url") String teacherapkUrl,
      @HiveField(6) @JsonKey(name: "project_url") String projectUrl,
      @HiveField(7) @JsonKey(name: "default_password") String defaultPassword});
}

/// @nodoc
class __$TeacherVerificationCopyWithImpl<$Res>
    implements _$TeacherVerificationCopyWith<$Res> {
  __$TeacherVerificationCopyWithImpl(this._self, this._then);

  final _TeacherVerification _self;
  final $Res Function(_TeacherVerification) _then;

  /// Create a copy of TeacherVerification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? schoolId = null,
    Object? name = null,
    Object? shortName = null,
    Object? url = null,
    Object? teacherapkUrl = null,
    Object? projectUrl = null,
    Object? defaultPassword = null,
  }) {
    return _then(_TeacherVerification(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      schoolId: null == schoolId
          ? _self.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      teacherapkUrl: null == teacherapkUrl
          ? _self.teacherapkUrl
          : teacherapkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      projectUrl: null == projectUrl
          ? _self.projectUrl
          : projectUrl // ignore: cast_nullable_to_non_nullable
              as String,
      defaultPassword: null == defaultPassword
          ? _self.defaultPassword
          : defaultPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
