import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:teacherapp/views/home/remark/provider/remark_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../features/auth/providers/auth_provider.dart';
import 'model/remark.dart';
import 'model/remark_attachment.dart';

class EditRemark extends HookConsumerWidget {
  final Remark remark;
  const EditRemark({super.key, required this.remark});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Controllers
    final _dateController = useTextEditingController(text: remark.remarkDate.split(' ').first);
    final _subjectOfRemarkController = useTextEditingController(text: remark.remarkSubject);
    final _remarkController = useTextEditingController(text: remark.remarkType);

    final selectedSubject = useState<String>(remark.subName ?? "");
    final selectedClass = useState<String>("${remark.className} ${remark.secName}");
    final selectedStudents = useState<List<String>>([
      "${remark.firstName} ${remark.midName} ${remark.lastName}"
    ]);

    final attachments = useState<List<RemarkAttachment>>([]);
    final attachmentUrl = useState<String>("");
    final loadingAttachments = useState<bool>(false);
    final uploading = useState<bool>(false);

    // Load attachments effect
    useEffect(() {
      loadingAttachments.value = true;
      Future.microtask(() async {
        final remarkService = ref.read(remarkServiceProvider);
        final auth = ref.read(authProvider).requireValue;
        try {
          final res = await remarkService.getRemarkImages(
            remarkId: remark.remarkId,
            remarkDate: _dateController.text,
            shortName: auth.teacherVerification?.shortName ?? '',
          );
          attachments.value = res.cast<RemarkAttachment>();
          // attachmentUrl.value = attachments.value.isNotEmpty ? attachments.value. : "";
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to load attachments: $e')),
          );
        }
        loadingAttachments.value = false;
      });
      return null;
    }, [_dateController.text]);

    // Attachments upload handler
    Future<void> uploadAttachment() async {
      final result = await FilePicker.platform.pickFiles(allowMultiple: true, withData: true);
      if (result == null || result.files.isEmpty) return;

      uploading.value = true;
      final remarkService = ref.read(remarkServiceProvider);
      final auth = ref.read(authProvider).requireValue;
      bool allOk = true;

      for (final file in result.files) {
        try {
          final uploadOk = await remarkService.uploadRemarkDocument(
            studentIds: json.encode([remark.studentId]),
            shortName: auth.teacherVerification?.shortName ?? '',
            filename: file.name,
            fileBytes: file.bytes!,
            uploadDate: _dateController.text,
          );
          if (!uploadOk) {
            allOk = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to upload ${file.name}')),
            );
          }
        } catch (e) {
          allOk = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error uploading ${file.name}: $e')),
          );
        }
      }

      uploading.value = false;
      if (allOk) {
        loadingAttachments.value = true;
        final remarkService = ref.read(remarkServiceProvider);
        final auth = ref.read(authProvider).requireValue;
        try {
          final res = await remarkService.getRemarkImages(
            remarkId: remark.remarkId,
            remarkDate: _dateController.text,
            shortName: auth.teacherVerification?.shortName ?? '',
          );
          attachments.value = res.cast<RemarkAttachment>();
          // attachmentUrl.value = attachments.value.isNotEmpty ? attachments.value.url : "";
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to load attachments: $e')),
          );
        }
        loadingAttachments.value = false;
      }
    }

    Future<void> deleteAttachment(RemarkAttachment att) async {
      final remarkService = ref.read(remarkServiceProvider);
      final auth = ref.read(authProvider).requireValue;

      try {
        final ok = await remarkService.deleteRemarkDocument(
          upload_date: _dateController.text,
          student_id: json.encode([remark.remarkId]),
          shortName: auth.teacherVerification?.shortName ?? '',
          filename: att.imageName,
        );
        if (ok) {
          // refresh
          final res = await remarkService.getRemarkImages(
            remarkId: remark.remarkId,
            remarkDate: _dateController.text,
            shortName: auth.teacherVerification?.shortName ?? '',
          );
          attachments.value = res.cast<RemarkAttachment>();
          // attachmentUrl.value = attachments.value.isNotEmpty ? attachments.value.url : "";
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Attachment Deleted ${att.imageName}')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Attachment Delete failed!')));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Delete error: $e')));
      }
    }

    Future<void> onDownload(String filename) async {
      try {
        final response = await http.get(Uri.parse(filename));
        if (response.statusCode == 200) {
          // Use any downloading logic (such as download() from your library)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('File downloaded successfully: $filename'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to download file: $filename'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error downloading file: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    Future<void> onOpenAttachment(String url) async {
      final uri = Uri.tryParse(url);
      if (uri == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Invalid attachment URL')));
        return;
      }
      try {
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Could not open attachment')));
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error opening attachment: $e')));
      }
    }

    void _resetForm() {
      _dateController.text = remark.remarkDate.split(' ').first;
      _subjectOfRemarkController.text = remark.remarkSubject;
      _remarkController.text = remark.remarkType;
    }

    String formatDateForApi(String date) {
      final parts = date.split('-');
      if (parts.length == 3 && parts.length == 4) {
        return '${parts[2]}-${parts[1]}-${parts}';
      }
      return date;
    }

    Future<void> _saveRemark() async {
      final remarkService = ref.read(remarkServiceProvider);
      final auth = ref.read(authProvider).requireValue;

      try {
        final formattedDate = formatDateForApi(_dateController.text);

        final success = await remarkService.updateRemark(
          remarkId: remark.remarkId,
          remarkSubject: _subjectOfRemarkController.text,
          remarkDesc: _remarkController.text,
          remarkDate: formattedDate,
          academicYr: auth.academicYr ?? '',
          teacherId: auth.regId ?? '',
          shortName: auth.teacherVerification?.shortName ?? '',
          classId: remark.classId,
          sectionId: remark.sectionId,
          subjectId: remark.subjectId,
          studentId: remark.studentId,
          remarkType: remark.remarkType,
          publish: "N",
          acknowledge: "N",
          fileName: attachments.value.isNotEmpty ? attachments.value.map((a) => a.imageName).join(",") : "",
        );

        if (success['status'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Remark Updated Successfully!")),
          );
          Navigator.of(context).pop(true);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(success['error_msg'] ?? "Failed to update remark")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error updating remark: $e")),
        );
      }
    }

    Widget _readonlyTile(String label) => Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.grey.shade300,
      ),
      child: Text(label, style: TextStyle(fontSize: 14.sp, color: Colors.black87)),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40.h,
        title: const Text("Edit Remark", style: TextStyle(color: Colors.white, fontSize: 20)),
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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 150.h),
            child: Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("*Class", style: TextStyle(fontWeight: FontWeight.bold)),
                  _readonlyTile(selectedClass.value),
                  SizedBox(height: 20.h),

                  const Text("*Subject", style: TextStyle(fontWeight: FontWeight.bold)),
                  _readonlyTile(selectedSubject.value),
                  SizedBox(height: 10.h),

                  const Text("*Students", style: TextStyle(fontWeight: FontWeight.bold)),
                  _readonlyTile(selectedStudents.value.join(", ")),
                  SizedBox(height: 10.h),

                  const Text("*Subject of Remark", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    controller: _subjectOfRemarkController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  const Text("*Remark", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    controller: _remarkController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Attachments", style: TextStyle(fontWeight: FontWeight.bold)),
                      uploading.value
                          ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                          : IconButton(
                        icon: const Icon(Icons.attach_file, color: Colors.blue),
                        onPressed: uploading.value ? null : uploadAttachment,
                      ),
                    ],
                  ),

                  SizedBox(height: 2.h),
                  if (loadingAttachments.value)
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: LinearProgressIndicator(),
                    )
                  else if (attachments.value.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: attachments.value.map((att) {
                        final url = "${att.url}/${att.imageName}";
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            children: [
                              if(att.imageName.contains('.jpg'))
                                 Icon(Icons.remove_red_eye, color: Colors.redAccent

                              ) else  Icon(Icons.insert_drive_file, color: Colors.blue),

                              const SizedBox(width: 5),

                              if(att.imageName.contains('.jpg'))
                              Expanded(
                                child: TextButton( onPressed: () {
                                  onOpenAttachment(url);
                                },
                                child: Text(att.imageName, style: const TextStyle(fontSize: 13))),
                              ) else Expanded(
                                child: TextButton( onPressed: () {
                                  // onOpenAttachment(url);
                                },
                                    child: Text(att.imageName, style: const TextStyle(color:Colors.black,fontSize: 13))),
                              ),
                              IconButton(
                                icon: const Icon(Icons.download, color: Colors.blue),
                                onPressed: () {
                                  onDownload(url);
                                  },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => deleteAttachment(att),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text("No attachments", style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),

                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 78, 157, 222),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                          onPressed: _saveRemark,
                          icon: Icon(Icons.save, size: 16.sp, color: Colors.white),
                          label: const Text("Update", style: TextStyle(color: Colors.white, fontSize: 14)),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade400,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                          onPressed: _resetForm,
                          icon: Icon(Icons.refresh, size: 16.sp, color: Colors.black),
                          label: const Text("Reset", style: TextStyle(color: Colors.black, fontSize: 14)),
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
    );
  }
}
