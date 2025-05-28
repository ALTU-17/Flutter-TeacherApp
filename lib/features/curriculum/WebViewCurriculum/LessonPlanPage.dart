import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LessonPlanPage extends StatefulWidget {
  const LessonPlanPage({Key? key}) : super(key: key);

  @override
  State<LessonPlanPage> createState() => _LessonPlanTemplatePageState();
}

class _LessonPlanTemplatePageState extends State<LessonPlanPage> {
  bool _isLoading = true;

  final String shortName = "SACS";
  final String regId = "14";
  final String acdYr = "2025";
  final String newUrl = "https://sms.arnoldcentralschool.org/SACSv4test/index.php/";
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // print("WEBVIEW URL: " +
    //     widget.smartchat_url +
    //     '?student_id=${widget.studentId}&academic_yr=${widget.academicYr}');

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _isLoading = true; // Show loading indicator when page starts loading
            });
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false; // Hide loading indicator when page finishes loading
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(newUrl+"curriculum/apk_lesson_plan?reg_id=${regId}&acd_yr=${acdYr}&login_type=T"
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40.h,
        title: const Text(
          "Lesson Plan",
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
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 100.h),
                Expanded(
                  child: WebViewWidget(controller: _controller),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(), // Display loading spinner
            ),
        ],
      ),
    );
  }
}