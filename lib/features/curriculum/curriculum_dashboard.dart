import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import 'Chapters/ChaptersPage.dart';
import 'LessonPlanHeading/LessonPlanHeadingPage.dart';
import 'Providers/curriculum_role_provider.dart';
import 'WebViewCurriculum/LessonPlanPage.dart';
import 'WebViewCurriculum/LessonPlanTemplatePage.dart';

class CurriculumPage extends HookConsumerWidget {
  const CurriculumPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roleInfoAsync = ref.watch(curriculumRolePProvider);

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
        child: roleInfoAsync.when(
          loading: () => const Center(
              child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e', style: TextStyle(color: Colors.white))),
          data: (roleInfo) {
            // if (roleInfo == null) {
            //   return Center(
            //     child: Text(
            //       'No curriculum role information found.',
            //       style: TextStyle(color: Colors.white, fontSize: 16.sp),
            //     ),
            //   );
            // }

            // final showChapters = roleInfo.role == 'curri coordinator' || roleInfo.role == 'dept coordinator';
            // final showLessonPlanHeading = roleInfo.role == 'curri coordinator';

            final curriculumItems = [
              CurriculumItem(title: "Chapters", icon: Icons.menu_book),
              CurriculumItem(title: "Lesson Plan Heading", icon: Icons.format_list_numbered),
              CurriculumItem(title: "Lesson Plan Template", icon: Icons.description),
              CurriculumItem(title: "Lesson Plan", icon: Icons.assignment),
            ];

            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 140.h),
              itemCount: curriculumItems.length,
              itemBuilder: (context, index) {
                final item = curriculumItems[index];

                // Hide items based on role
                // if ((index == 0 && !showChapters) ||
                //     (index == 1 && !showLessonPlanHeading) ||
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
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChaptersPage()));
                          break;
                        case 1:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LessonPlanHeadingPage()));
                          break;
                        case 2:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LessonPlanTemplatePage()));
                          break;
                        case 3:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LessonPlanPage()));
                          break;
                      }
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CurriculumItem {
  final String title;
  final IconData icon;

  CurriculumItem({required this.title, required this.icon});
}