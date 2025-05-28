import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:teacherapp/features/auth/models/models.dart';
import 'package:teacherapp/providers/api_client_provider.dart';

import '../../auth/providers/auth_provider.dart';
import '../../leave_application/models/auth_data.dart';
import '../models/models.dart';
import '../services/services.dart';

part 'attendance_provider.g.dart';

@Riverpod(keepAlive: false)
class AttendanceP extends _$AttendanceP {
  late AttendanceService _attendanceService;

  @override
  Future<List<Students>> build(StudentBody param) async {
    final authData = _getAuthData();
    if (!authData.isValid) return [];

    final api = await ref.read(apiClientProvider.future);

    _attendanceService = AttendanceService(api, authData.url);

    final data = param.copyWith(
      shortName: authData.shortName,
      academicYr: authData.academicYr,
    );

    return await _attendanceService.getStudents(data);
  }

  Future onChange(String year, ClassInfo classin) async {
    state = AsyncData([]);
  }

  AuthData _getAuthData() {
    final auth = ref.read(authProvider).requireValue;
    return AuthData(
      shortName: auth.teacherVerification?.shortName ?? '',
      url: auth.teacherVerification?.teacherapkUrl ?? '',
      regId: auth.regId ?? '',
      academicYr: auth.academicYr ?? '',
    );
  }
}
