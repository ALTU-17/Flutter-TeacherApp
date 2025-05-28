import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Chapters/ChaptersPage.dart';
import 'LessonPlanHeading/LessonPlanHeadingPage.dart';
import 'WebViewCurriculum/LessonPlanPage.dart';
import 'WebViewCurriculum/LessonPlanTemplatePage.dart';

class CurriculumPage extends StatefulWidget {
  const CurriculumPage({super.key});

  @override
  State<CurriculumPage> createState() => _CurriculumPageState();
}

class _CurriculumPageState extends State<CurriculumPage> {
  final List<CurriculumItem> curriculumItems = [
    CurriculumItem(title: "Chapters", icon: Icons.menu_book),
    CurriculumItem(title: "Lesson Plan Heading", icon: Icons.format_list_numbered),
    CurriculumItem(title: "Lesson Plan Template", icon: Icons.description),
    CurriculumItem(title: "Lesson Plan", icon: Icons.assignment),
  ];

  bool isLoading = true;
  String? errorMessage;
  String? deptId;
  String? role;
  bool showChapters = false;
  // bool showTopics = false;
  bool showLessonPlanHeading = false;

  @override
  void initState() {
    super.initState();
    _fetchCurriculumData();
  }

  Future<void> _fetchCurriculumData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // Replace with your actual API call
      // final response = await CurriculumApiService.getAllotDep(
      //   name: 'school_name',
      //   regId: 'teacher_id',
      //   academicYear: '2024-2025',
      // );

      // Mock response - replace with actual API response
      await Future.delayed(const Duration(seconds: 1));

      // Mock data based on your Java code
      final mockRole = "dept coordinator"; // or "curri coordinator"
      final mockDeptId = "123";

      setState(() {
        role = mockRole;
        deptId = mockDeptId;

        // Set visibility based on role
        // if (role == "curri coordinator") {
        //   showChapters = true;
        //   showLessonPlanHeading = true;
        // } else if (role == "dept coordinator") {
        //   showChapters = true;
        //   showLessonPlanHeading = false;
        // }
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching curriculum data: $e';
      });
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChaptersPage(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  LessonPlanHeadingPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LessonPlanTemplatePage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LessonPlanPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40.h,
        title: const Text(
          "Curriculum (2024-2025)",
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
        child: Column(
          children: [
            SizedBox(height: 120.h),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : errorMessage != null
                  ? Center(
                child: Text(
                  errorMessage!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              )
                  : _buildCurriculumList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurriculumList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      itemCount: curriculumItems.length,
      itemBuilder: (context, index) {
        final item = curriculumItems[index];

        // Hide items based on role
        // if ((index == 1 && !showLessonPlanHeading) ||
        //     (index == 2 && !showLessonPlanHeading)) {
        //   return const SizedBox.shrink();
        // }

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 3,
          child: ListTile(
            leading: Icon(item.icon, size: 28.sp, color: Colors.blueAccent),
            title: Text(
              item.title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _navigateToPage(index),
          ),
        );
      },
    );
  }
}

class CurriculumItem {
  final String title;
  final IconData icon;

  CurriculumItem({required this.title, required this.icon});
}

// Placeholder pages for navigation
class ChaptersPage1 extends StatelessWidget {
  final String? deptId;

  const ChaptersPage1({super.key, this.deptId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chapters")),
      body: Center(child: Text("Chapters Page - Dept ID: ${deptId ?? 'N/A'}")),
    );
  }
}

