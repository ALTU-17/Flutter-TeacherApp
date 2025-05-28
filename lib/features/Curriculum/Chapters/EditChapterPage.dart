import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ChaptersPage.dart';

class EditChapterPage extends StatefulWidget {
  final Chapter chapter;

  const EditChapterPage({super.key, required this.chapter});

  @override
  State<EditChapterPage> createState() => _EditChapterPageState();
}

class _EditChapterPageState extends State<EditChapterPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _lessonNumberController;
  late TextEditingController _nameController;
  late TextEditingController _subSubjectController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _lessonNumberController = TextEditingController(text: widget.chapter.lessonNo);
    _nameController = TextEditingController(text: widget.chapter.name);
    _subSubjectController = TextEditingController(text: widget.chapter.subSubject);
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _lessonNumberController.dispose();
    _nameController.dispose();
    _subSubjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _lessonNumberController.text = widget.chapter.lessonNo;
      _nameController.text = widget.chapter.name;
      _subSubjectController.text = widget.chapter.subSubject;
      _descriptionController.clear();
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process data and save chapter
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Chapter updated successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40.h,
        title: const Text(
          "Edit Chapter",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 208, 28, 127),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 130.h),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Non-editable Class and Subject
                      // SizedBox(height: 80.h),

                      Row(
                        children: [
                          Text(
                            " *Class",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.h),
                          Container(
                            padding: EdgeInsets.fromLTRB(8,5,8,5),

                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              widget.chapter.classNumber,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                          SizedBox(width: 20.h),

                          _buildNonEditableField(
                            label: " *Subject",
                            value: widget.chapter.subject,
                          ),
                        ],
                      ),

                      SizedBox(height: 15.h),

                      // Editable fields
                      _buildFormField(
                        label: "*Lesson Number",
                        hintText: "Enter lesson number",
                        controller: _lessonNumberController,
                        keyboardType: TextInputType.number,
                        isRequired: true,
                      ),
                      SizedBox(height: 15.h),

                      _buildFormField(
                        label: "*Name",
                        hintText: "Enter chapter name",
                        controller: _nameController,
                        isRequired: true,
                      ),
                      SizedBox(height: 15.h),

                      _buildFormField(
                        label: "Sub-Subject",
                        hintText: "Enter sub-subject",
                        controller: _subSubjectController,
                      ),
                      SizedBox(height: 15.h),

                      // Description Field
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "Type here...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          contentPadding: EdgeInsets.all(12.w),
                        ),
                      ),
                      SizedBox(height: 30.h),

                      // Buttons Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Save Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 12.h),
                            ),
                            onPressed: _submitForm,
                            child: Text(
                              "Update",
                              style: TextStyle(fontSize: 16.sp,color: Colors.white),
                            ),
                          ),

                          // Reset Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white24,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
                            ),
                            onPressed: _resetForm,
                            child: Text(
                              "Reset",
                              style: TextStyle(fontSize: 16.sp, color: Colors.black),
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

  Widget _buildNonEditableField({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10.h),
          Container(
            padding: EdgeInsets.all(8.w),

            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              value,
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
        ],),

      ],
    );
  }

  Widget _buildFormField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            contentPadding: EdgeInsets.all(10.w),
          ),
          validator: isRequired
              ? (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          }
              : null,
        ),
      ],
    );
  }
}