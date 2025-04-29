import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import 'models.dart';

part 'teacher_user.freezed.dart';
part 'teacher_user.g.dart';

@freezed
abstract class TeacherUser with _$TeacherUser {
  @HiveType(typeId: 1, adapterName: 'TeacherUserAdapter')
  const factory TeacherUser({
    @HiveField(0)
    @JsonKey(name: "teacher_verification")
    TeacherVerification? teacherVerification,
    @HiveField(2) @JsonKey(name: "error")  bool? error,
    @HiveField(3) @JsonKey(name: "reg_id")  String? regId,
    @HiveField(4) @JsonKey(name: "password")  String? password,
    @HiveField(5) @JsonKey(name: "default_pwd")  String? defaultPwd,
    @HiveField(6) @JsonKey(name: "name")  String? name,
    @HiveField(7) @JsonKey(name: "user_id")  String? userId,
    @HiveField(8) @JsonKey(name: "role_id")  String? roleId,
    @HiveField(9) @JsonKey(name: "academic_yr")  String? academicYr,
  }) = _TeacherUser;

  factory TeacherUser.fromJson(Map<String, dynamic> json) =>
      _$TeacherUserFromJson(json);
}
