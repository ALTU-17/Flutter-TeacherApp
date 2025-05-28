import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CreateChapterPage.dart';
import 'EditChapterPage.dart';

class ChaptersPage extends StatefulWidget {
  const ChaptersPage({super.key});

  @override
  State<ChaptersPage> createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  bool selectAll = false;
  final List<Chapter> chapters = [
    Chapter(
      classNumber: '5',
      subject: 'English',
      lessonNo: '3',
      name: 'Downhill on A Bicycle',
      subSubject: 'English',
      createdBy: 'SUNITA PETER GEORGE',
      isPublished: false,
    ),
    Chapter(
      classNumber: '5',
      subject: 'English',
      lessonNo: '4',
      name: 'A French Lesson',
      subSubject: 'English',
      createdBy: 'SUNITA PETER GEORGE',
      isPublished: true,
    ),
    Chapter(
      classNumber: '5',
      subject: 'SST',
      lessonNo: '2',
      name: 'Parallels And Meridians',
      subSubject: 'SST',
      createdBy: 'SUNITA PETER GEORGE',
      isPublished: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 30.h,
        title: Text(
          "Manage Chapters",
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
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
            SizedBox(height: 130.h),

            // Header with Publish and Select All buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.publish, size: 18),
                    label: Text('Publish Selected', style: TextStyle(fontSize: 14.sp,color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    ),
                    onPressed: () {
                      // Publish all selected chapters
                      final selected = chapters.where((c) => c.isSelected).toList();
                      if (selected.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please select at least one chapter')),
                        );
                        return;
                      }
                      _publishChapters(selected);
                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectAll = !selectAll;
                        for (var chapter in chapters) {
                          chapter.isSelected = selectAll;
                        }
                      });
                    },
                    child: Text(
                      selectAll ? 'Unselect All' : 'Select All',
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // SizedBox(height: 10.h),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  final chapter = chapters[index];
                  // In your ListView.builder itemBuilder:
                  return ChapterCard(
                    chapter: chapter,
                    onSelectionChanged: (selected) {
                      setState(() {
                        chapters[index].isSelected = selected;
                        selectAll = chapters.every((c) => c.isSelected);
                      });
                    },
                    onPublishChanged: (published) {
                      setState(() => chapters[index].isPublished = published);
                    },
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditChapterPage(chapter: chapter),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 208, 28, 127),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CreateChapterPage()),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _publishChapters(List<Chapter> chapters) {
    // Implement publish API call here
    setState(() {
      for (var chapter in chapters) {
        chapter.isPublished = true;
        chapter.isSelected = false;
      }
      selectAll = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Published ${chapters.length} chapters')),
    );
  }
}

class Chapter {
  final String classNumber;
  final String subject;
  final String lessonNo;
  final String name;
  final String subSubject;
  final String createdBy;
  bool isPublished;
  bool isSelected;

  Chapter({
    required this.classNumber,
    required this.subject,
    required this.lessonNo,
    required this.name,
    required this.subSubject,
    required this.createdBy,
    required this.isPublished,
    this.isSelected = false,
  });
}

class ChapterCard extends StatelessWidget {
  final Chapter chapter;
  final ValueChanged<bool> onSelectionChanged;
  final ValueChanged<bool> onPublishChanged;
  final VoidCallback? onEdit;

  const ChapterCard({
    super.key,
    required this.chapter,
    required this.onSelectionChanged,
    required this.onPublishChanged,
    this.onEdit,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Chapter details
            _buildDetailRow('Class', '${chapter.classNumber} | ${chapter.subject} | Lesson No: ${chapter.lessonNo}'),
            _buildDetailRow('Name', chapter.name),
            if (chapter.subSubject.isNotEmpty)
              _buildDetailRow('Sub-Subject', chapter.subSubject),
            _buildDetailRow('Created By', chapter.createdBy),

            SizedBox(height: 12.h),

            // Publish button
            Row(
              children: [
                if (!chapter.isPublished)
                Checkbox(
                  value: chapter.isSelected,
                  onChanged: (value) => onSelectionChanged(value ?? false),
                ),

                if (!chapter.isPublished)
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: onEdit,
                ),
                if (!chapter.isPublished)
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete Chapter'),
                          content: const Text('Are you sure you want to delete this chapter?'),
                          actions: [
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: const Text('Delete', style: TextStyle(color: Colors.red)),
                              onPressed: () {
                                Navigator.pop(context);
                                // Implement delete functionality
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                if(!chapter.isPublished)
                SizedBox(

                  // width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: chapter.isPublished ? Colors.grey : Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: chapter.isPublished ? null : () => onPublishChanged(true),
                    child: Text(
                      chapter.isPublished ? 'PUBLISHED' : 'PUBLISH',
                      style: TextStyle(color: Colors.white,fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 14.sp, color: Colors.black),
          children: [
            TextSpan(
              text: '$label : ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

