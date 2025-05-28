// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_p_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotPBody {
  @JsonKey(name: "short_name")
  String? get shortName;
  @JsonKey(name: "user_id")
  String? get userId;
  @JsonKey(name: "answer_one")
  String? get answerOne;
  @JsonKey(name: "password_re")
  String? get passwordRe;
  @JsonKey(name: "password_old")
  String? get passwordOld;
  @JsonKey(name: "password_new")
  String? get passwordNew;

  /// Create a copy of ForgotPBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForgotPBodyCopyWith<ForgotPBody> get copyWith =>
      _$ForgotPBodyCopyWithImpl<ForgotPBody>(this as ForgotPBody, _$identity);

  /// Serializes this ForgotPBody to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForgotPBody &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.answerOne, answerOne) ||
                other.answerOne == answerOne) &&
            (identical(other.passwordRe, passwordRe) ||
                other.passwordRe == passwordRe) &&
            (identical(other.passwordOld, passwordOld) ||
                other.passwordOld == passwordOld) &&
            (identical(other.passwordNew, passwordNew) ||
                other.passwordNew == passwordNew));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, shortName, userId, answerOne,
      passwordRe, passwordOld, passwordNew);

  @override
  String toString() {
    return 'ForgotPBody(shortName: $shortName, userId: $userId, answerOne: $answerOne, passwordRe: $passwordRe, passwordOld: $passwordOld, passwordNew: $passwordNew)';
  }
}

/// @nodoc
abstract mixin class $ForgotPBodyCopyWith<$Res> {
  factory $ForgotPBodyCopyWith(
          ForgotPBody value, $Res Function(ForgotPBody) _then) =
      _$ForgotPBodyCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "short_name") String? shortName,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "answer_one") String? answerOne,
      @JsonKey(name: "password_re") String? passwordRe,
      @JsonKey(name: "password_old") String? passwordOld,
      @JsonKey(name: "password_new") String? passwordNew});
}

/// @nodoc
class _$ForgotPBodyCopyWithImpl<$Res> implements $ForgotPBodyCopyWith<$Res> {
  _$ForgotPBodyCopyWithImpl(this._self, this._then);

  final ForgotPBody _self;
  final $Res Function(ForgotPBody) _then;

  /// Create a copy of ForgotPBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortName = freezed,
    Object? userId = freezed,
    Object? answerOne = freezed,
    Object? passwordRe = freezed,
    Object? passwordOld = freezed,
    Object? passwordNew = freezed,
  }) {
    return _then(_self.copyWith(
      shortName: freezed == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      answerOne: freezed == answerOne
          ? _self.answerOne
          : answerOne // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordRe: freezed == passwordRe
          ? _self.passwordRe
          : passwordRe // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordOld: freezed == passwordOld
          ? _self.passwordOld
          : passwordOld // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordNew: freezed == passwordNew
          ? _self.passwordNew
          : passwordNew // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ForgotPBody implements ForgotPBody {
  const _ForgotPBody(
      {@JsonKey(name: "short_name") this.shortName,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "answer_one") this.answerOne,
      @JsonKey(name: "password_re") this.passwordRe,
      @JsonKey(name: "password_old") this.passwordOld,
      @JsonKey(name: "password_new") this.passwordNew});
  factory _ForgotPBody.fromJson(Map<String, dynamic> json) =>
      _$ForgotPBodyFromJson(json);

  @override
  @JsonKey(name: "short_name")
  final String? shortName;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @JsonKey(name: "answer_one")
  final String? answerOne;
  @override
  @JsonKey(name: "password_re")
  final String? passwordRe;
  @override
  @JsonKey(name: "password_old")
  final String? passwordOld;
  @override
  @JsonKey(name: "password_new")
  final String? passwordNew;

  /// Create a copy of ForgotPBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForgotPBodyCopyWith<_ForgotPBody> get copyWith =>
      __$ForgotPBodyCopyWithImpl<_ForgotPBody>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ForgotPBodyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForgotPBody &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.answerOne, answerOne) ||
                other.answerOne == answerOne) &&
            (identical(other.passwordRe, passwordRe) ||
                other.passwordRe == passwordRe) &&
            (identical(other.passwordOld, passwordOld) ||
                other.passwordOld == passwordOld) &&
            (identical(other.passwordNew, passwordNew) ||
                other.passwordNew == passwordNew));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, shortName, userId, answerOne,
      passwordRe, passwordOld, passwordNew);

  @override
  String toString() {
    return 'ForgotPBody(shortName: $shortName, userId: $userId, answerOne: $answerOne, passwordRe: $passwordRe, passwordOld: $passwordOld, passwordNew: $passwordNew)';
  }
}

/// @nodoc
abstract mixin class _$ForgotPBodyCopyWith<$Res>
    implements $ForgotPBodyCopyWith<$Res> {
  factory _$ForgotPBodyCopyWith(
          _ForgotPBody value, $Res Function(_ForgotPBody) _then) =
      __$ForgotPBodyCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "short_name") String? shortName,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "answer_one") String? answerOne,
      @JsonKey(name: "password_re") String? passwordRe,
      @JsonKey(name: "password_old") String? passwordOld,
      @JsonKey(name: "password_new") String? passwordNew});
}

/// @nodoc
class __$ForgotPBodyCopyWithImpl<$Res> implements _$ForgotPBodyCopyWith<$Res> {
  __$ForgotPBodyCopyWithImpl(this._self, this._then);

  final _ForgotPBody _self;
  final $Res Function(_ForgotPBody) _then;

  /// Create a copy of ForgotPBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? shortName = freezed,
    Object? userId = freezed,
    Object? answerOne = freezed,
    Object? passwordRe = freezed,
    Object? passwordOld = freezed,
    Object? passwordNew = freezed,
  }) {
    return _then(_ForgotPBody(
      shortName: freezed == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      answerOne: freezed == answerOne
          ? _self.answerOne
          : answerOne // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordRe: freezed == passwordRe
          ? _self.passwordRe
          : passwordRe // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordOld: freezed == passwordOld
          ? _self.passwordOld
          : passwordOld // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordNew: freezed == passwordNew
          ? _self.passwordNew
          : passwordNew // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
