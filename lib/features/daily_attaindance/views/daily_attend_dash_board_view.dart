import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:teacherapp/features/auth/auth.dart';
import 'package:teacherapp/features/auth/models/models.dart';
import 'package:teacherapp/features/daily_attaindance/providers/class_provider.dart';
import 'package:teacherapp/features/daily_attaindance/providers/providers.dart';

import '../models/student.dart';
import '../models/student_body.dart';

class DailyAttendDashboardView extends HookConsumerWidget {
  const DailyAttendDashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateController = useTextEditingController();
    final selectedDate = useState<String?>(null);
    final selectedClass = useState<ClassInfo?>(null);

    final academicYr = ref.read(authProvider).requireValue.academicYr;
    final classes = ref.watch(classPProvider).value;

    void selectDate() async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2030),
      );
      if (picked != null) {
        selectedDate.value = "${picked.year}-${picked.month}-${picked.day}";
        dateController.text = selectedDate.value!;
      }
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Daily Attendance $academicYr",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 226, 25, 99),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// Class & Date Selection
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "*Class",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        FormBuilderDropdown<ClassInfo>(
                          name: 'class_selection',
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          hint: const Text("Select Class"),
                          items: classes
                                  ?.map((cls) => DropdownMenuItem(
                                        value: cls,
                                        child: Text(
                                          "${cls.className} ${cls.sectionName}",
                                        ),
                                      ))
                                  .toList() ??
                              [],
                          onChanged: (value) {
                            selectedClass.value = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "*Select Date",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        TextFormField(
                          controller: dateController,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "Select Date",
                            prefixIcon: const Icon(Icons.calendar_today),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          onTap: selectDate,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              (selectedClass.value != null && selectedDate.value != null)
                  ? Expanded(
                      child: StudentList(
                        selectedClass.value!,
                        selectedDate.value!,
                      ),
                    )
                  : SizedBox.shrink(),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 26, 134, 222),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 12.h,
                  ),
                ),
                onPressed: () {
                  // TODO: Implement update logic
                },
                child: const Text(
                  "Update",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentList extends HookConsumerWidget {
  final ClassInfo classInfo;
  final String date;
  const StudentList(this.classInfo, this.date, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final d = StudentBody(
      classID: classInfo.classId,
      sectionID: classInfo.sectionId,
      onlyDate: date,
    );
    final students = ref.watch(attendancePProvider(d));

    return students.when(
      data: (d) {
        if (d.isEmpty) {
          return const Center(child: Text("No data"));
        }

        return Column(
          children: [
            /// Heading Row
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              color: const Color.fromARGB(255, 233, 219, 236),
              child: Row(
                children: const [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "Select",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "Roll No",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        "Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        "Absent",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Student List
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: d.length,
                  itemBuilder: (BuildContext context, int index) {
                    final student = d[index];
                    if (student.rollNo == null) return SizedBox.shrink();
                    return StudentTile(student);
                  },
                ),
              ),
            ),

            /// Optional delete button
            // d.first.deleteBtn == '1'
            //     ? ElevatedButton(
            //         onPressed: () {
            //           // TODO: Delete attendance logic
            //         },
            //         child: const Text("Delete Attendance"),
            //       )
            //     : const SizedBox.shrink(),
          ],
        );
      },
      error: (error, stackTrace) =>
          const Center(child: Text("Error loading data")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class StudentTile extends HookConsumerWidget {
  final Students student;

  const StudentTile(this.student, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final check = useState(false);
    return Card(
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(value: true, onChanged: (value) {}),
            CircleAvatar(child: Text((student.rollNo).toString())),
          ],
        ),
        title: Text("${student.firstName} ${student.lastName}"),
        trailing: Checkbox(
          value: (student.attendanceStatus == '1' || check.value),
          onChanged: (v) => check.value = v ?? false,
        ),
      ),
    );
  }
}
