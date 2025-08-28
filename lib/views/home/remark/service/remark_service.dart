import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../editRemark.dart';
import '../model/ClassSubStudentModel.dart';
import '../model/remark.dart';
import '../model/remark_attachment.dart';

class RemarkService {
  final Dio apiClient;
  final String baseUrl;
  RemarkService(this.apiClient, this.baseUrl);

  Future<List<Remark>> getRemarks({
    required String academicYr,
    required String regId,
    required String shortName,
  }) async {
    final res = await apiClient.post(
      '${baseUrl}AdminApi/get_remark_teacherwise',
      data: {
        'academic_yr': academicYr,
        'reg_id': regId,
        'login_type': 'T',
        'short_name': shortName,
      },
    );

    if (res.statusCode == 200 && res.data['status'] == true) {
      return (res.data['remark'] as List)
          .map((e) => Remark.fromJson(e))
          .toList();
    }
    return [];
  }

  Future<List<ClassSection>> getClassSections(String academicYr, String regId, String shortName) async {
    final res = await apiClient.post(
      '${baseUrl}AdminApi/getClassAndSection_teacheralloted',
      data: {
        'academic_yr': academicYr,
        'reg_id': regId,
        'short_name': shortName,
      },
    );
    if (res.statusCode == 200 && res.data['status'] == true) {
      return (res.data['class_name'] as List)
          .map((e) => ClassSection.fromJson(e))
          .toList();
    }
    return [];
  }

  Future<List<Subject>> getSubjects(String academicYr, String regId, String classId, String sectionId, String shortName) async {
    final res = await apiClient.post(
      '${baseUrl}AdminApi/get_subject_alloted_to_teacher_by_class',
      data: {
        'academic_yr': academicYr,
        'reg_id': regId,
        'class_id': classId,
        'section_id': sectionId,
        'short_name': shortName,
      },
    );
    if (res.statusCode == 200 && res.data['status'] == true) {
      return (res.data['subject_name'] as List)
          .map((e) => Subject.fromJson(e))
          .toList();
    }
    return [];
  }

  Future<List<Student>> getStudents(String academicYr, String classId, String sectionId, String shortName) async {
    final res = await apiClient.post(
      '${baseUrl}AdminApi/get_students',
      data: {
        'academic_yr': academicYr,
        'class_id': classId,
        'section_id': sectionId,
        'short_name': shortName,
      },
    );
    if (res.statusCode == 200 && res.data['status'] == true) {
      return (res.data['students'] as List)
          .map((e) => Student.fromJson(e))
          .toList();
    }
    return [];
  }

  Future<bool> uploadRemarkDocument({
    // required String academicYr,
    required String studentIds,
    required String shortName,
    required List<int> fileBytes,
    required String uploadDate,
    // String docTypeFolder = "remark",
    required String filename,

  }) async {
    try {
      final response = await apiClient.post(
        '${baseUrl}AdminApi/upload_remark_files',
        data: FormData.fromMap({
          // 'acd_yr': academicYr,
          'student_id': studentIds,
          'short_name': shortName,
          'datafile': base64Encode(fileBytes),
          'upload_date': uploadDate,
          'doc_type_folder': "remark",
          'filename': filename,

        }),
      );
      if (response.statusCode == 200) {
        final jsonResponse = response.data is String
            ? json.decode(response.data)   // in some setups, Dio returns a String
            : response.data;
        return jsonResponse['status'] == true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Delete a file/attachment for a Remark
  Future<bool> deleteRemarkDocument({
    required String upload_date,
    required String student_id,
    required String shortName,
    required String filename,
  }) async {
    try {
      final response = await apiClient.post(
        '${baseUrl}AdminApi/delete_uploaded_remark_files',
        data: FormData.fromMap({
          'upload_date': upload_date,
          'student_id': student_id,
          'short_name': shortName,
          'filename': filename,
          'doc_type_folder': "remark",
        }),
      );
      if (response.statusCode == 200) {
        final jsonResponse = response.data is String
            ? json.decode(response.data)
            : response.data;
        return jsonResponse['status'] == true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }


  Future<Map<String, dynamic>> createRemark({
    required String academicYr,
    required String teacherId,
    required String sectionId,
    required String classId,
    required String subjectId,
    required String fileName,
    required String studentIds,
    required String remarkDesc,
    required String remarkSubject,
    required String remarkDate,
    required String shortName,
    required String remarkType,
  }) async {
    final res = await apiClient.post(
      '${baseUrl}AdminApi/remark',
      data: {
        'academic_yr': academicYr,
        'teacher_id': teacherId,
        'section_id': sectionId,
        'class_id': classId,
        if(subjectId == null)
        'subject_id': '0' else
          'subject_id': subjectId,

        'filename': fileName,
        'student_id': studentIds, // send as List<String>
        'remark_desc': remarkDesc,
        'publish': 'N',
        'remark_subject': remarkSubject,
        'remark_date': remarkDate,
        'login_type': 'T',
        'operation': 'create',
        'short_name': shortName,
        'remark_type': remarkType,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
        responseType: ResponseType.plain, // <--- for debugging
      ),
    );

    print("Status: ${res.statusCode}");
    print("Raw Response: ${res.data}");
    return res.data;
  }

  Future<Map<String, dynamic>> updateRemark({
    required String remarkId,
    required String academicYr,
    required String teacherId,
    required String sectionId,
    required String classId,
    required String subjectId,
    required String studentId,
    required String remarkDesc,
    required String remarkSubject,
    required String remarkDate,
    required String shortName,
    required String remarkType,
    String fileName = "",
    String publish = "N",
    String acknowledge = "N",
    String loginType = "T",
    String operation = "edit",
  }) async {
    final res = await apiClient.post(
      '${baseUrl}AdminApi/remark',
      data: {
        'academic_yr': academicYr,
        'teacher_id': teacherId,
        'section_id': sectionId,
        'class_id': classId,
        'subject_id': subjectId,
        'student_id': studentId,
        'remark_id': remarkId,
        'remark_desc': remarkDesc,
        'remark_subject': remarkSubject,
        'publish': publish,
        'acknowledge': acknowledge,
        'remark_date': remarkDate,
        'login_type': loginType,
        'operation': operation,
        'short_name': shortName,
        'remark_type': remarkType,
        'filename': fileName,

      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
        responseType: ResponseType.plain,
      ),
    );

    print("Update Remark Status: ${res.statusCode}");
    print("Update Remark Raw Response: ${res.data}");

    // Parse the response if it's JSON
    if (res.data is String) {
      try {
        return json.decode(res.data);
      } catch (e) {
        return {'status': false, 'error': 'Failed to parse response: $e'};
      }
    }

    return res.data;
  }

  Future<List<RemarkAttachment>> getRemarkImages({
    required String remarkId,
    required String remarkDate,
    required String shortName,
  }) async {
    final res = await apiClient.post(
      '${baseUrl}AdminApi/get_images_remark',
      data: {
        'remark_id': remarkId,
        'remark_date': remarkDate,
        'short_name': shortName,
      },
    );
    if (res.statusCode == 200 && res.data['status'] == true) {
      final List attachments = res.data['images'];
      final url = res.data['url'] as String? ?? "";
      // You can return both as a tuple if you need the base url
      return attachments.map((e) => RemarkAttachment.fromJson({...e, "url": url})).toList();
    }
    return [];
  }

  Future<bool> deleteRemark({
    required String remarkId,
    required String academicYr,
    required String teacherId,
    required String classId,
    required String sectionId,
    required String subjectId,
    required String remarkDesc,
    required String studentId,
    required String remarkDate,
    required String remarkSubject,
    required String shortName,
  }) async {
    try {
      final res = await apiClient.post(
        '${baseUrl}AdminApi/remark',
        data: {
          'remark_id': remarkId,
          'publish': 'N',
          'acknowledge': 'N',
          'operation': 'delete',
          'login_type': 'T',
          'academic_yr': academicYr,
          'teacher_id': teacherId,
          'class_id': classId,
          'section_id': sectionId,
          'subject_id': subjectId,
          'remark_desc': remarkDesc,
          'student_id': studentId,
          'remark_date': remarkDate,
          'remark_subject': remarkSubject,
          'short_name': shortName,
        },
        options: Options(
          headers: {"Content-Type": "application/json"},
          responseType: ResponseType.plain,
        ),
      );

      print("Delete Remark Status: ${res.statusCode}");
      print("Delete Remark Response: ${res.data}");

      final data = res.data is String ? json.decode(res.data) : res.data;
      return data['status'] == true;
    } catch (e) {
      print("Delete Remark Error: $e");
      return false;
    }
  }


  Future<Map<String, dynamic>> publishRemark({
    required String remarkId,
    required String teacherId,
    required String studentId,
    required String shortName,
    String publish = "Y",
    String operation = "publish",
    String loginType = "T",
  }) async {
    final res = await apiClient.post(
      '${baseUrl}AdminApi/remark',
      data: {
        'remark_id': remarkId,
        'publish': publish,
        'operation': operation,
        'login_type': loginType,
        'teacher_id': teacherId,
        'student_id': studentId,
        'short_name': shortName,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
        responseType: ResponseType.plain,
      ),
    );

    print("Publish Remark Status: ${res.statusCode}");
    print("Publish Remark Raw Response: ${res.data}");

    // Parse the response if it's JSON
    if (res.data is String) {
      try {
        return json.decode(res.data);
      } catch (e) {
        return {'status': false, 'error': 'Failed to parse response: $e'};
      }
    }

    return res.data;
  }


  Future<bool> euploadRemarkDocument({
    // required String academicYr,
    required String studentIds,
    required String shortName,
    required String filename,
    required Uint8List fileBytes,
    required String uploadDate,
    required String academicYr,
    required String teacherId,
    required String remarkId,

  }) async {
    try {
      final response = await apiClient.post(
        '${baseUrl}AdminApi/upload_remark_files',
        data: FormData.fromMap({
          // 'acd_yr': academicYr,
          'student_id': remarkId,
          'short_name': shortName,
          'datafile': base64Encode(fileBytes),
          'upload_date': uploadDate,
          'doc_type_folder': "remark",
          'filename': filename,

        }),
      );
      if (response.statusCode == 200) {
        final jsonResponse = response.data is String
            ? json.decode(response.data)   // in some setups, Dio returns a String
            : response.data;
        return jsonResponse['status'] == true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Delete a file/attachment for a Remark
  Future<bool> edeleteRemarkDocument({
    required String academicYr,
    required String teacherId,
    required String shortName,
    required String filename,
    required String remarkId,
    required String uploadDate,
  }) async {
    try {
      final response = await apiClient.post(
        '${baseUrl}AdminApi/delete_uploaded_remark_files',
        data: FormData.fromMap({
          'upload_date': uploadDate,
          'student_id': remarkId,
          'short_name': shortName,
          'filename': filename,
          'doc_type_folder': "remark",
        }),
      );
      if (response.statusCode == 200) {
        final jsonResponse = response.data is String
            ? json.decode(response.data)
            : response.data;
        return jsonResponse['status'] == true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }


}
