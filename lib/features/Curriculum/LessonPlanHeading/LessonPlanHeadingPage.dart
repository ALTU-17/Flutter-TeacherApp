import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CreateLessonPlanHeadingPage.dart';
import 'EditLessonPlanHeadingPage.dart';

class LessonPlanHeadingPage extends StatelessWidget {
  LessonPlanHeadingPage({super.key});

  final List<Map<String, dynamic>> headings = [
    {'title': 'Teaching Points', 'sequence': 1},
    {'title': 'Learning Objectives', 'sequence': 2},
    {'title': 'Teaching Method', 'sequence': 3},
    {'title': 'Teaching Aids', 'sequence': 4},
    {'title': 'Learning Outcomes', 'sequence': 5},
    {'title': 'Students Activity', 'sequence': 6},
    {'title': 'Homework/ Assessm', 'sequence': 7},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 50.h,
        title: const Text(
          "Lesson Plan Headings",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: const Color.fromARGB(255, 208, 28, 127),
        centerTitle: true,
        elevation: 5,
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            children: [
              SizedBox(height: 10.h), // Adjust for app bar overlap

              // Headings List
              Expanded(
                child: ListView.builder(
                  itemCount: headings.length,
                  itemBuilder: (context, index) {
                    final heading = headings[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 20.r,
                                    backgroundColor: Colors.blueAccent,
                                    child: Text(
                                      heading['sequence'].toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: Text(
                                      heading['title'],
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),

                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit, color: Colors.blue),
                                        tooltip: "Edit Heading",
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => EditLessonPlanHeadingPage(
                                                heading: heading['title'],
                                                sequence: heading['sequence'],
                                                changeDaily: false,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                        tooltip: "Delete Heading",
                                        onPressed: () {
                                          // Delete functionality
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // SizedBox(height: 10.h),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 208, 28, 127),
        tooltip: "Add Lesson Plan Heading",
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CreateLessonPlanHeadingPage()),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}