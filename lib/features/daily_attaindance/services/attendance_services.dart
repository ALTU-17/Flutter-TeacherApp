import 'package:dio/dio.dart';

import '../models/models.dart';

class AttendanceService {
  final Dio apiClient;
  final String baseUrl;
  const AttendanceService(this.apiClient, this.baseUrl);

  Future<List<Students>> getStudents(StudentBody body) async {
    try {
      final response = await apiClient.post(
        '${baseUrl}AdminApi/get_attendance_students',
        data: FormData.fromMap(body.copyWith(academicYr: '2024-2025').toJson()),
        // data: FormData.fromMap({
        //   'academic_yr': '2024-2025', //TODO NEED TO FECT IT FROM THE SETTINGS
        //   'class_id': body.classID,
        //   'section_id': body.sectionID,
        //   'only_date': body.onlyDate,
        //   'short_name': body.shortName
        // }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        if (jsonResponse['status'] == true) {
          final List<dynamic> data = jsonResponse['students'];
          return data.map((item) => Students.fromJson(item)).toList();
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to load students applications');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
