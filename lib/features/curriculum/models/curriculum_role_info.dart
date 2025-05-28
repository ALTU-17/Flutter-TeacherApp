import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'curriculum_role_info.freezed.dart';
part 'curriculum_role_info.g.dart';

@freezed
abstract class CurriculumRoleInfo with _$CurriculumRoleInfo {
  @HiveType(typeId: 10, adapterName: 'CurriculumRoleInfoAdapter')
  const factory CurriculumRoleInfo({
    @HiveField(0) String? role,
    @HiveField(1) String? deptId,
  }) = _CurriculumRoleInfo;

  factory CurriculumRoleInfo.fromJson(Map<String, dynamic> json) =>
      _$CurriculumRoleInfoFromJson(json);
}