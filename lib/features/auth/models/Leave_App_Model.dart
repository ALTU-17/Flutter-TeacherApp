class LeaveApplication {
  final String leaveAppId;
  final String staffId;
  final String leaveTypeId;
  final String leaveStartDate;
  final String leaveEndDate;
  final String noOfDays;
  final String approvedBy;
  final String status;
  final String reason;
  final String reasonForRejection;
  final String academicYear;
  final String name;

  LeaveApplication({
    required this.leaveAppId,
    required this.staffId,
    required this.leaveTypeId,
    required this.leaveStartDate,
    required this.leaveEndDate,
    required this.noOfDays,
    required this.approvedBy,
    required this.status,
    required this.reason,
    required this.reasonForRejection,
    required this.academicYear,
    required this.name,
  });

  factory LeaveApplication.fromJson(Map<String, dynamic> json) {
    return LeaveApplication(
      leaveAppId: json['leave_app_id'] ?? '',
      staffId: json['staff_id'] ?? '',
      leaveTypeId: json['leave_type_id']?.toString() ?? '',
      leaveStartDate: json['leave_start_date'] ?? '',
      leaveEndDate: json['leave_end_date'] ?? '',
      noOfDays: json['no_of_days'] ?? '',
      approvedBy: json['approved_by'] ?? '',
      status: json['status'] ?? '',
      reason: json['reason'] ?? '',
      reasonForRejection: json['reason_for_rejection'] ?? '',
      academicYear: json['academic_yr'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class LeaveBalance {
  final String leaveTypeId;
  final String name;
  final String leavesAllocated;
  final String leavesAvailed;
  final String remainingLeaves;

  LeaveBalance({
    required this.leaveTypeId,
    required this.name,
    required this.leavesAllocated,
    required this.leavesAvailed,
    required this.remainingLeaves,
  });

  factory LeaveBalance.fromJson(Map<String, dynamic> json) {
    final allocated = double.parse(json['leaves_allocated'].toString());
    final availed = double.parse(json['leaves_availed'].toString());
    final remaining = (allocated - availed).toStringAsFixed(1);

    return LeaveBalance(
      leaveTypeId: json['leave_type_id']?.toString() ?? '',
      name: json['name'] ?? '',
      leavesAllocated: json['leaves_allocated']?.toString() ?? '',
      leavesAvailed: json['leaves_availed']?.toString() ?? '',
      remainingLeaves: remaining,
    );
  }
}