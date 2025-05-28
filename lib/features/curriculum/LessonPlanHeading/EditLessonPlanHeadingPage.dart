import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:teacherapp/features/curriculum/LessonPlanHeading/providers/lesson_plan_heading_provider.dart';
import '../../auth/providers/auth_provider.dart';

class EditLessonPlanHeadingPage extends HookConsumerWidget {
  final String id;
  final String heading;
  final String sequence;
  final bool changeDaily;

  const EditLessonPlanHeadingPage({
    super.key,
    required this.id,
    required this.heading,
    required this.sequence,
    required this.changeDaily,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final _headingController = TextEditingController(text: heading);
    final _sequenceController = TextEditingController(text: sequence);
    final _changeDaily = ValueNotifier<bool>(changeDaily);

    void _resetForm() {
      _headingController.text = heading;
      _sequenceController.text = sequence;
      _changeDaily.value = changeDaily;
    }

    Future<void> _onUpdate() async {
      if (!_formKey.currentState!.validate()) return;
      final auth = ref.read(authProvider).requireValue;
      final service = ref.read(lessonPlanHeadingCreateProvider);

      final result = await service.editHeading(
        id: id,
        sequence: _sequenceController.text,
        name: _headingController.text,
        shortName: auth.teacherVerification?.shortName ?? '',
        changeDaily: _changeDaily.value,
      );

      if (result['status'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lesson Plan Heading Updated!')),
        );
        Navigator.pop(context, true); // return to list and refresh
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['error_msg'] ?? 'Update failed')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Lesson Plan Heading',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 208, 28, 127),
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
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),

                      TextFormField(
                        controller: _headingController,
                        decoration: InputDecoration(
                          labelText: '*Lesson Plan Heading',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          contentPadding: EdgeInsets.all(12.w),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a heading.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),

                      TextFormField(
                        controller: _sequenceController,
                        decoration: InputDecoration(
                          labelText: '*Sequence',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          contentPadding: EdgeInsets.all(12.w),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a sequence number.';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),

                      ValueListenableBuilder<bool>(
                        valueListenable: _changeDaily,
                        builder: (context, value, _) => Row(
                          children: [
                            Checkbox(
                              value: value,
                              onChanged: (v) => _changeDaily.value = v ?? false,
                            ),
                            Text(
                              'Change daily',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: _onUpdate,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 12.h),
                            ),
                            child: Text(
                              'Update',
                              style: TextStyle(fontSize: 16.sp, color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _resetForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 12.h),
                            ),
                            child: Text(
                              'Reset',
                              style: TextStyle(fontSize: 16.sp, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
