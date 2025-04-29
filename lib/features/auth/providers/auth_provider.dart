import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:teacherapp/config/utils.dart';
import '../../../providers/provider.dart';
import '../models/models.dart';
import '../services/services.dart';
part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  late final AuthService _authService;
  @override
  //user check here
  Future<TeacherUser> build() async {
    final api = await ref.read(apiClientProvider.future);
    _authService = AuthService(api);
    final u = _authService.getCachedUser();
    if (u == null) return TeacherUser();
    return u;
  }

  Future<bool> validateTeacher(String userID) async {
    final res = await _authService.validateTeacher(userID);
    state = AsyncData(TeacherUser(teacherVerification: res));
    return true;
  }

  login(String password) async {
    final res = await _authService.logInUser(password);

    if (res == null) return;
    Utils.debLog(res.toJson());
    state = AsyncData(res);
  }

  Future<bool> changePassword(ForgotPBody b) async {
    final res = await _authService.changePassword(b);
    // if (res) {
    //   return await logOut();
    // }
    return res;
    // Utils.debLog(b.toJson());
    // return true;
  }

  logOut() async {
    await _authService.logout();

    state = AsyncData(TeacherUser());
  }

  profileUpdate(TeacherDetails teacherDetails) async {
    final res = await _authService.profileUpdate(teacherDetails);
    if (res != null) state = AsyncData(res);
  }

  Future profileImageUpload(File image) async {
    final res = await _authService.profileImageUpload(image);
    //if (res) ref.invalidateSelf();
  }
}
