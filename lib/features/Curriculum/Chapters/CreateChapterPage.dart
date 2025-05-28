import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateChapterPage extends StatefulWidget {
  const CreateChapterPage({super.key});

  @override
  State<CreateChapterPage> createState() => _CreateChapterPageState();
}

class _CreateChapterPageState extends State<CreateChapterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _lessonNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subSubjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _classController.dispose();
    _subjectController.dispose();
    _lessonNumberController.dispose();
    _nameController.dispose();
    _subSubjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _classController.clear();
      _subjectController.clear();
      _lessonNumberController.clear();
      _nameController.clear();
      _subSubjectController.clear();
      _descriptionController.clear();
    });
  }

  void _submitForm(bool publish) {
    if (_formKey.currentState!.validate()) {
      // Process data and save chapter
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(publish ? 'Chapter saved and published!' : 'Chapter saved!')),
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
          "Create Chapters",
          style: TextStyle(fontSize: 20, color: Colors.white),
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
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 130.h),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              // elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 10.h),

                      // Class Field
                      _buildFormField(
                        label: "*Class",
                        hintText: "Enter class",
                        controller: _classController,
                        isRequired: true,
                      ),
                      SizedBox(height: 10.h),

                      // Subject Field
                      _buildFormField(
                        label: "*Subject",
                        hintText: "Enter subject",
                        controller: _subjectController,
                        isRequired: true,
                      ),
                      SizedBox(height: 10.h),
                      // Lesson Number Field
                      _buildFormField(
                        label: "*Lesson Number",
                        hintText: "Enter lesson number",
                        controller: _lessonNumberController,
                        keyboardType: TextInputType.number,
                        isRequired: true,
                      ),
                      SizedBox(height: 10.h),
                      // Name Field
                      _buildFormField(
                        label: "*Name",
                        hintText: "Enter chapter name",
                        controller: _nameController,
                        isRequired: true,
                      ),
                      SizedBox(height: 10.h),
                      // Sub-Subject Field
                      _buildFormField(
                        label: "Sub-Subject",
                        hintText: "Enter sub-subject",
                        controller: _subSubjectController,
                      ),
                      SizedBox(height: 10.h),
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
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Type here...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          contentPadding: EdgeInsets.all(12.w),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
                            ),
                            onPressed: () => _submitForm(false),
                            child: Text(
                              "Save",
                              style: TextStyle(fontSize: 14.sp,color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white24,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                            ),
                            onPressed: _resetForm,
                            child: Text(
                              "Reset",
                              style: TextStyle(fontSize: 14.sp, color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                            ),
                            onPressed: () => _submitForm(true),
                            child: Text(
                              "Save & Publish",
                              style: TextStyle(fontSize: 14.sp,color: Colors.white),
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
        SizedBox(height: 5.h),
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