import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:teacherapp/config/utils.dart';

import '../models/models.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio apiClient;
  late final Box<TeacherUser> userBox;
  AuthService(this.apiClient) : userBox = Hive.box('teacherUserCache');
  Future<TeacherVerification> validateTeacher(String userId) async {
    final res = await apiClient
        .post('/validate_teacher_user', data: FormData.fromMap({"user_id": userId}));
    final moRes =
        TeacherVerification.fromJson(res.data).copyWith(userId: userId);
    userBox.put("teacherUserCache", TeacherUser(teacherVerification: moRes));
    return moRes;
  }

  Future<bool> logout() async {
    await userBox.delete("teacherUserCache");
    return true;
  }

  Future<TeacherUser?> logInUser(String password) async {
    final verTeacher = userBox.get('teacherUserCache');
    if (verTeacher == null) return null;
    final userId = verTeacher.teacherVerification?.userId;
    final baseUrl = verTeacher.teacherVerification?.teacherapkUrl;
    final shortName = verTeacher.teacherVerification?.shortName;
    if (userId == null || baseUrl == null || shortName == null) return null;
    final url = '${baseUrl}LoginApi/login';
    final res = await apiClient.post(url, data: FormData.fromMap({
      "user_id": userId,
      "password": password,
      "short_name": shortName
    }));
    if (res.statusCode == 200) {
      if(res.data.toString().contains('error_msg')){ 
         Utils.toast(res.data['error_msg']);
         return null;
      }
     Utils.toast("Login successful",true);
      return TeacherUser.fromJson(res.data)
          .copyWith(teacherVerification: verTeacher.teacherVerification);
   }
    return null;
  }
}
