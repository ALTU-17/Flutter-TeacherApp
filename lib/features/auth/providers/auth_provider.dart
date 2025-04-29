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
  Future<TeacherUser> build() async {
    final api = await ref.read(apiClientProvider.future);
    _authService = AuthService(api);
    return TeacherUser();
  }

  Future<bool> validateTeacher(String userID) async {
    final res = await _authService.validateTeacher(userID);
    state = AsyncData(TeacherUser(teacherVerification: res));
    return true;
  }
login(String password)async{
   final res = await _authService.logInUser(password);
   if(res==null) return;
    state = AsyncData(res);
}
  logOut() async {
    await _authService.logout();
    state = AsyncData(TeacherUser());
  }
}
