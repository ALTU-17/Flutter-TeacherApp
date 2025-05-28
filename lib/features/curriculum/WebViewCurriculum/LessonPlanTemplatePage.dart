import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LessonPlanTemplatePage extends StatefulWidget {
  const LessonPlanTemplatePage({Key? key}) : super(key: key);

  @override
  State<LessonPlanTemplatePage> createState() => _LessonPlanTemplatePageState();
}

class _LessonPlanTemplatePageState extends State<LessonPlanTemplatePage> {
  late WebViewController _webViewController;
  bool _isLoading = true;

  // Replace these with your actual dynamic values
  final String regId = "sample_reg_id"; // Example: Fetch this dynamically
  final String acdYr = "2025"; // Example: Fetch this dynamically
  final String newUrl = "https://example.com/"; // Example: Fetch from database or API
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
      ..loadRequest(Uri.parse(
          "https://sms.arnoldcentralschool.org/SACSv4test/index.php/curriculum/apk_lesson_plan_template?reg_id=33&acd_yr=2024-2025&login_type=T"
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text(
          "Lesson Plan Template",
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

  