// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudentBody {
  @JsonKey(name: "academic_yr")
  String? get academicYr;
  @JsonKey(name: "class_id")
  String? get classID;
  @JsonKey(name: "section_id")
  String? get sectionID;
  @JsonKey(name: "only_date")
  String? get onlyDate;
  @JsonKey(name: "short_name")
  String? get shortName;

  /// Create a copy of StudentBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StudentBodyCopyWith<StudentBody> get copyWith =>
      _$StudentBodyCopyWithImpl<StudentBody>(this as StudentBody, _$identity);

  /// Serializes this StudentBody to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StudentBody &&
            (identical(other.academicYr, academicYr) ||
                other.academicYr == academicYr) &&
            (identical(other.classID, classID) || other.classID == classID) &&
            (identical(other.sectionID, sectionID) ||
                other.sectionID == sectionID) &&
            (identical(other.onlyDate, onlyDate) ||
                other.onlyDate == onlyDate) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, academicYr, classID, sectionID, onlyDate, shortName);

  @override
  String toString() {
    return 'StudentBody(academicYr: $academicYr, classID: $classID, sectionID: $sectionID, onlyDate: $onlyDate, shortName: $shortName)';
  }
}

/// @nodoc
abstract mixin class $StudentBodyCopyWith<$Res> {
  factory $StudentBodyCopyWith(
          StudentBody value, $Res Function(StudentBody) _then) =
      _$StudentBodyCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "academic_yr") String? academicYr,
      @JsonKey(name: "class_id") String? classID,
      @JsonKey(name: "section_id") String? sectionID,
      @JsonKey(name: "only_date") String? onlyDate,
      @JsonKey(name: "short_name") String? shortName});
}

/// @nodoc
class _$StudentBodyCopyWithImpl<$Res> implements $StudentBodyCopyWith<$Res> {
  _$StudentBodyCopyWithImpl(this._self, this._then);

  final StudentBody _self;
  final $Res Function(StudentBody) _then;

  /// Create a copy of StudentBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? academicYr = freezed,
    Object? classID = freezed,
    Object? sectionID = freezed,
    Object? onlyDate = freezed,
    Object? shortName = freezed,
  }) {
    return _then(_self.copyWith(
      academicYr: freezed == academicYr
          ? _self.academicYr
          : academicYr // ignore: cast_nullable_to_non_nullable
              as String?,
      classID: freezed == classID
          ? _self.classID
          : classID // ignore: cast_nullable_to_non_nullable
              as String?,
      sectionID: freezed == sectionID
          ? _self.sectionID
          : sectionID // ignore: cast_nullable_to_non_nullable
              as String?,
      onlyDate: freezed == onlyDate
          ? _self.onlyDate
          : onlyDate // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _StudentBody implements StudentBody {
  const _StudentBody(
      {@JsonKey(name: "academic_yr") this.academicYr,
      @JsonKey(name: "class_id") this.classID,
      @JsonKey(name: "section_id") this.sectionID,
      @JsonKey(name: "only_date") this.onlyDate,
      @JsonKey(name: "short_name") this.shortName});
  factory _StudentBody.fromJson(Map<String, dynamic> json) =>
      _$StudentBodyFromJson(json);

  @override
  @JsonKey(name: "academic_yr")
  final String? academicYr;
  @override
  @JsonKey(name: "class_id")
  final String? classID;
  @override
  @JsonKey(name: "section_id")
  final String? sectionID;
  @override
  @JsonKey(name: "only_date")
  final String? onlyDate;
  @override
  @JsonKey(name: "short_name")
  final String? shortName;

  /// Create a copy of StudentBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StudentBodyCopyWith<_StudentBody> get copyWith =>
      __$StudentBodyCopyWithImpl<_StudentBody>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StudentBodyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StudentBody &&
            (identical(other.academicYr, academicYr) ||
                other.academicYr == academicYr) &&
            (identical(other.classID, classID) || other.classID == classID) &&
            (identical(other.sectionID, sectionID) ||
                other.sectionID == sectionID) &&
            (identical(other.onlyDate, onlyDate) ||
                other.onlyDate == onlyDate) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, academicYr, classID, sectionID, onlyDate, shortName);

  @override
  String toString() {
    return 'StudentBody(academicYr: $academicYr, classID: $classID, sectionID: $sectionID, onlyDate: $onlyDate, shortName: $shortName)';
  }
}

/// @nodoc
abstract mixin class _$StudentBodyCopyWith<$Res>
    implements $StudentBodyCopyWith<$Res> {
  factory _$StudentBodyCopyWith(
          _StudentBody value, $Res Function(_StudentBody) _then) =
      __$StudentBodyCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "academic_yr") String? academicYr,
      @JsonKey(name: "class_id") String? classID,
      @JsonKey(name: "section_id") String? sectionID,
      @JsonKey(name: "only_date") String? onlyDate,
      @JsonKey(name: "short_name") String? shortName});
}

/// @nodoc
class __$StudentBodyCopyWithImpl<$Res> implements _$StudentBodyCopyWith<$Res> {
  __$StudentBodyCopyWithImpl(this._self, this._then);

  final _StudentBody _self;
  final $Res Function(_StudentBody) _then;

  /// Create a copy of StudentBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? academicYr = freezed,
    Object? classID = freezed,
    Object? sectionID = freezed,
    Object? onlyDate = freezed,
    Object? shortName = freezed,
  }) {
    return _then(_StudentBody(
      academicYr: freezed == academicYr
          ? _self.academicYr
          : academicYr // ignore: cast_nullable_to_non_nullable
              as String?,
      classID: freezed == classID
          ? _self.classID
          : classID // ignore: cast_nullable_to_non_nullable
              as String?,
      sectionID: freezed == sectionID
          ? _self.sectionID
          : sectionID // ignore: cast_nullable_to_non_nullable
              as String?,
      onlyDate: freezed == onlyDate
          ? _self.onlyDate
          : onlyDate // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
