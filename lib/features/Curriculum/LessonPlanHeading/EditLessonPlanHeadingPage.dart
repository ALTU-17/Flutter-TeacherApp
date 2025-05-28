import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditLessonPlanHeadingPage extends StatefulWidget {
  final String heading;
  final int sequence;
  final bool changeDaily;

  const EditLessonPlanHeadingPage({
    super.key,
    required this.heading,
    required this.sequence,
    required this.changeDaily,
  });

  @override
  _EditLessonPlanHeadingPageState createState() =>
      _EditLessonPlanHeadingPageState();
}

class _EditLessonPlanHeadingPageState
    extends State<EditLessonPlanHeadingPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _headingController;
  late TextEditingController _sequenceController;
  late bool _changeDaily;

  @override
  void initState() {
    super.initState();
    // Initialize with the passed values
    _headingController = TextEditingController(text: widget.heading);
    _sequenceController = TextEditingController(text: widget.sequence.toString());
    _changeDaily = widget.changeDaily;
  }

  @override
  void dispose() {
    _headingController.dispose();
    _sequenceController.dispose();
    super.dispose();
  }

  void _resetForm() {
    setState(() {
      _headingController.text = widget.heading;
      _sequenceController.text = widget.sequence.toString();
      _changeDaily = widget.changeDaily;
    });
  }

  @override
  Widget build(BuildContext context) {
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

                      // Lesson Plan Heading Field
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

                      // Sequence Field
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

                      // Change Daily Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: _changeDaily,
                            onChanged: (bool? value) {
                              setState(() {
                                _changeDaily = value ?? false;
                              });
                            },
                          ),
                          Text(
                            'Change daily',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),

                      // Buttons Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Save functionality
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Lesson Plan Heading Updated!'),
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            },
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