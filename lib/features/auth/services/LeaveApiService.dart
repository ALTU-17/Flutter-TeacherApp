import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/Leave_App_Model.dart';


class LeaveApiService {

  final String LeavebaseUrl = 'https://sms.arnoldcentralschool.org/SACSv4test/index.php';

  static Future<List<LeaveApplication>> fetchLeaveApplications({
    required String baseUrl,
    required String academicYear,
    required String staffId,
    required String shortName,
  }) async {
    final url = Uri.parse('https://sms.arnoldcentralschool.org/SACSv4test/index.php/AdminApi/get_leave_applied_by_staff_info');

    try {
      final response = await http.post(
        url,
        body: {
          'acd_yr': '2024-2025',
          'staff_id': '14',
          'short_name': 'SACS',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == true) {
          final List<dynamic> data = jsonResponse['leave_info'];
          return data.map((item) => LeaveApplication.fromJson(item)).toList();
        } else {
          throw Exception('No records found');
        }
      } else {
        throw Exception('Failed to load leave applications');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

// 2. Get balance leave (for leave types dropdown)
  Future<List<LeaveBalance>> getBalanceLeave({
    required String academicYear,
    required String regId,
    required String shortName,
  }) async {
    final url = Uri.parse('$LeavebaseUrl/AdminApi/get_balance_leave');

    try {
      final response = await http.post(
        url,
        body: {
          'acd_yr': '2024-2025',
          'reg_id': '14',
          'short_name': 'SACS',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Add null check for the response and data
        if (jsonResponse == null || jsonResponse['balance_leave'] == null) {
          print('Error fetching leave balances: $jsonResponse');

          throw Exception('No leave balance data available');
        }

        final List<dynamic> data = jsonResponse['balance_leave'];

        // Check if data is empty
        if (data.isEmpty) {
          throw Exception('No leave types allocated yet');
        }

        return data.map((item) => LeaveBalance.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load leave balance: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching leave balance: $e');
    }
  }

  // 3. Create leave application
  Future<bool> createLeaveApplication({
    required String leaveTypeId,
    required String startDate,
    required String endDate,
    required String noOfDays,
    required String staffId,
    required String academicYear,
    required String reason,
    required String shortName,
  }) async {
    final url = Uri.parse('$LeavebaseUrl/AdminApi/leave_application');

    try {
      final response = await http.post(
        url,
        body: {
          'leave_type_id': leaveTypeId,
          'start_date': startDate,
          'end_date': endDate,
          'no_of_days': noOfDays,
          'status': 'A', // Applied
          'reason_rejection': '',
          'staff_id': '14',
          'acd_yr': '2024-2025',
          'operation': 'create',
          'reason': reason,
          'short_name': 'SACS',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse['status'] == true;
      } else {
        throw Exception('Failed to create leave application');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // 4. Update leave application
  Future<bool> updateLeaveApplication({
    required String leaveAppId,
    required String leaveTypeId,
    required String startDate,
    required String endDate,
    required String noOfDays,
    required String reason,
    required String shortName,
    required String acd_yr,
  }) async {
    final url = Uri.parse('$LeavebaseUrl/AdminApi/leave_application');

    try {
      final response = await http.post(
        url,
        body: {
          'leave_app_id': leaveAppId,
          'leave_type_id': leaveTypeId,
          'start_date': startDate,
          'end_date': endDate,
          'no_of_days': noOfDays,
          'reason': reason,
          'staff_id': '14',
          'operation': 'edit',
          'status': 'A',
          'acd_yr': acd_yr,
          'short_name': shortName,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse['status'] == true;
      } else {
        throw Exception('Failed to update leave application');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // 5. Delete leave application
  Future<bool> deleteLeaveApplication({
    required String leaveAppId,
    required String shortName,
  }) async {
    final url = Uri.parse('$LeavebaseUrl/AdminApi/leave_application');

    try {
      final response = await http.post(
        url,
        body: {
          'leave_app_id': leaveAppId,
          'operation': 'delete',
          'short_name': shortName,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse['status'] == true;
      } else {
        throw Exception('Failed to delete leave application');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

}