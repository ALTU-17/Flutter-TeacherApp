import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacherapp/views/home/remark/model/remark.dart';
import 'package:teacherapp/views/home/remark/model/remark_attachment.dart';
import 'package:teacherapp/views/home/remark/provider/remark_provider.dart';
import 'package:teacherapp/views/home/remark/service/remark_service.dart';
import '../../../../features/auth/providers/auth_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;


class ViewRemark extends ConsumerStatefulWidget {
  final Remark remark;
  const ViewRemark({super.key, required this.remark});

  @override
  ConsumerState<ViewRemark> createState() => _ViewRemarkState();
}

class _ViewRemarkState extends ConsumerState<ViewRemark> {
  late String selectedSubject;
  late String selectedClass;
  late List<String> selectedStudents;
  List<RemarkAttachment> attachments = [];
  bool loadingAttachments = false;

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


  @override
  void initState() {
    super.initState();
    selectedSubject = widget.remark.subName ?? '';
    selectedClass = "${widget.remark.className} ${widget.remark.secName}";
    selectedStudents = [
      "${widget.remark.firstName ?? ''} ${widget.remark.midName ?? ''} ${widget.remark.lastName ?? ''}"
    ];
    fetchAttachments();
  }

  Future<void> fetchAttachments() async {
    setState(() => loadingAttachments = true);
    final remarkService = ref.read(remarkServiceProvider);
    final auth = ref.read(authProvider).requireValue;
    try {
      final res = await remarkService.getRemarkImages(
        remarkId: widget.remark.remarkId,
        remarkDate: widget.remark.remarkDate.split(' ').first,
        shortName: auth.teacherVerification?.shortName ?? '',
      );
      setState(() {
        attachments = res.cast<RemarkAttachment>();
        loadingAttachments = false;
      });
    } catch (e) {
      setState(() => loadingAttachments = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load attachments: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40.h,
        title: const Text("View Remark", style: TextStyle(color: Colors.white, fontSize: 20)),
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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 160.h),
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
                  _readonlyTile(selectedClass),
                  SizedBox(height: 10.h),

                  const Text("*Subject", style: TextStyle(fontWeight: FontWeight.bold)),
                  _readonlyTile(selectedSubject),
                  SizedBox(height: 10.h),

                  const Text("*Students", style: TextStyle(fontWeight: FontWeight.bold)),
                  _readonlyTile(selectedStudents.join(", ")),
                  SizedBox(height: 10.h),

                  const Text("*Subject of Remark", style: TextStyle(fontWeight: FontWeight.bold)),
                  _readonlyTile(widget.remark.remarkSubject),
                  SizedBox(height: 10.h),

                  const Text("*Remark", style: TextStyle(fontWeight: FontWeight.bold)),
                  _readonlyTile(widget.remark.remarkDesc ?? ''),
                  SizedBox(height: 10.h),

                  // Attach Document header row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Attach Document", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),

                  if (attachments.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: attachments.map((att) {
                        final url = "${att.url}/${att.imageName}";
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2), // minimal vertical gap
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
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
                        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                      ),
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      label: const Text("Back", style: TextStyle(color: Colors.black, fontSize: 14)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _readonlyTile(String label) => Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(10.r),
      color: Colors.grey[200],
    ),
    child: Text(label, style: TextStyle(fontSize: 14.sp, color: Colors.black87)),
  );
}
