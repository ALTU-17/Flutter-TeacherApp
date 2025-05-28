import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/chapter.dart';
import '../providers/chapter_list_provider.dart';
import '../providers/create_chapter_provider.dart';
import 'CreateChapterPage.dart';
import 'EditChapterPage.dart';
import '../../auth/providers/auth_provider.dart';


class ChaptersPage extends HookConsumerWidget {
  const ChaptersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chaptersAsync = ref.watch(chapterListPProvider);

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
        child: chaptersAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text('Error: $err')),
          data: (chapters) => ChaptersListBody(chapters: chapters),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 208, 28, 127),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateChapterPage()),
          );
          if (result == true) {
            // Replace `chapterListProvider` with your actual provider name
            ref.invalidate(chapterServiceProvider);
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),

    );
  }
}

class ChaptersListBody extends ConsumerStatefulWidget {
  final List<Chapter> chapters;
  const ChaptersListBody({super.key, required this.chapters});

  @override
  ConsumerState<ChaptersListBody> createState() => _ChaptersListBodyState();
}


class _ChaptersListBodyState extends ConsumerState<ChaptersListBody> {
  bool selectAll = false;
  late List<Chapter> chapters;

  @override
  void initState() {
    super.initState();
    chapters = widget.chapters;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 150.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.publish, size: 18),
                label: Text('Publish Selected', style: TextStyle(fontSize: 14.sp, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                ),
                onPressed: () {
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
                    for (var i = 0; i < chapters.length; i++) {
                      chapters[i] = chapters[i].copyWith(isSelected: selectAll);
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
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              final chapter = chapters[index];
              return ChapterCard(
                chapter: chapter,
                onSelectionChanged: (selected) {
                  setState(() {
                    chapters[index] = chapter.copyWith(isSelected: selected);
                    selectAll = chapters.every((c) => c.isSelected);
                  });
                },
                onPublishChanged: (published) {
                  setState(() {
                    chapters[index] = chapter.copyWith(isPublished: published);
                  });
                },
                onEdit: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditChapterPage(chapter: chapter),
                    ),
                  );

                  // if (result == true) {
                  //   // Refresh the list
                  //   ref.invalidate(chapterServiceProvider);
                  // }

                },
              );
            },
          ),
        ),
      ],
    );

  }


  Future<void> _publishChapters(List<Chapter> selectedChapters) async {
    // Build comma-separated IDs:
    final chapterIds = selectedChapters.map((c) => c.chapterId).whereType<String>().join(',');

    // Get auth:
    final auth = ref.read(authProvider).requireValue;
    final service = ref.read(chapterServiceProvider);

    // Call API:
    final result = await service.publishChapters(
      shortName: auth.teacherVerification?.shortName ?? '',
      selectedChapterIds: chapterIds,
      // operation & loginType can use default
    );

    if (result['status'] == true) {
      setState(() {
        for (var i = 0; i < chapters.length; i++) {
          if (selectedChapters.any((c) => c.chapterId == chapters[i].chapterId)) {
            chapters[i] = chapters[i].copyWith(isPublished: true, isSelected: false);
          }
        }
        selectAll = false;
      });
      ref.invalidate(chapterListPProvider);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['success_msg'] ?? 'Published!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['error_msg'] ?? 'Publish failed')),
      );
    }
  }

// void _publishChapters(List<Chapter> selectedChapters) {
  //   setState(() {
  //     for (var i = 0; i < chapters.length; i++) {
  //       if (selectedChapters.contains(chapters[i])) {
  //         chapters[i] = chapters[i].copyWith(isPublished: true, isSelected: false);
  //       }
  //     }
  //     selectAll = false;
  //   });
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text('Published ${selectedChapters.length} chapters')),
  //   );
  // }
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow(
              'Class',
              '${chapter.className ?? ""} | ${chapter.subName ?? ""} | Lesson No: ${chapter.chapterNo ?? ""}',
            ),
            _buildDetailRow('Name', chapter.name ?? ""),
            if ((chapter.subSubject ?? '').isNotEmpty)
              _buildDetailRow('Sub-Subject', chapter.subSubject ?? ""),
            _buildDetailRow('Created By', chapter.tecName ?? ""),
            SizedBox(height: 12.h),

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
                      // your delete logic
                    },
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
