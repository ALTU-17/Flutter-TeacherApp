import 'package:dio/dio.dart';
import 'package:hive_ce/hive.dart';
import 'package:teacherapp/features/auth/models/models.dart';
import '../models/chapter.dart';
import '../models/curriculum_role_info.dart';

class CurriculumService {
  final Dio apiClient;
  final String baseUrl;
  late final Box<TeacherUser> userBox;

  CurriculumService(this.apiClient, this.baseUrl)
      : userBox = Hive.box('teacherUserCache');

  Future<CurriculumRoleInfo?> getRoleInfo() async {
    final cachedUser = userBox.get('teacherUserCache');
    if (cachedUser == null) return null;

    final verification = cachedUser.teacherVerification;
    final regId = cachedUser.regId;
    final academicYr = cachedUser.academicYr;
    final name = verification?.shortName;

    if (name == null || regId == null || academicYr == null) return null;

    try {
      final response = await apiClient.post(
        '${baseUrl}CurriculumApi/get_allot_specialrole',
        data: FormData.fromMap({
          'short_name': name,
          'teacher_id': regId,
          'academic_yr': academicYr,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        if (jsonResponse['status'] == true) {
          // Map your actual API response fields below
          return CurriculumRoleInfo(
            role: jsonResponse['role'],
            deptId: jsonResponse['dept_id'],
          );
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}