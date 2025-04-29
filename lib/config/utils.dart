import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:teacherapp/config/config.dart';

class Utils {
  static debLog(print) {
    if (kDebugMode) {
      log(print.toString());
    }
  }

  static de(print) {
    if (kDebugMode) {
      debugger(message: print);
    }
  }

  static Future toast(String msg, [success = false]) {
    return Fluttertoast.showToast(
      backgroundColor:
          // ignore: deprecated_member_use
          success ? Colors.green.withOpacity(0.9) : primary.withOpacity(0.9),
      msg: msg,
    );
  }

  static String extractLastTenDigits(String phoneNumber) {
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
    if (phoneNumber.length < 10) {
      throw ArgumentError('Phone number must have at least 10 digits.');
    }

    String lastTenDigits = phoneNumber.substring(phoneNumber.length - 10);
    return lastTenDigits;
  }

  static String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input; // Handle empty string

    // Make the first letter uppercase and the rest lowercase
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  static String calculateReadingTime(String description) {
    // Average reading speed in words per minute
    const int wordsPerMinute = 200;

    // Split the text into words and count them
    int wordCount = description.split(RegExp(r'\s+')).length;

    // Calculate reading time in minutes
    double readingTime = wordCount / wordsPerMinute;

    // Round up to the nearest whole number
    int minutes = readingTime.ceil();

    // Return formatted string
    return minutes == 1 ? "$minutes" : "$minutes";
  }

  static bool containsElementTenTimes(List<String> items) {
    // Create a frequency map
    Map<dynamic, int> frequency = {};

    // Count occurrences of each element
    for (var item in items) {
      frequency[item] = (frequency[item] ?? 0) + 1;
      // If any element reaches 10 occurrences, return true early
      if (frequency[item] == 10) {
        return true;
      }
    }

    // Return false if no element appears 10 times
    return false;
  }

  static Color getRandomColor() {
    final random = math.Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
      1, // Opacity
    );
  }

  static Future<String> fileToBase64(File file) async {
    final bytes = await file.readAsBytes();
    return base64Encode(bytes);
  }
}

GlobalKey<FormBuilderState> useTextFieldGlobalKey() {
  return useMemoized(() => GlobalKey<FormBuilderState>());
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  Future<T> run<T>(Future<T> Function() action) {
    final completer = Completer<T>();

    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), () async {
      try {
        final result = await action();
        completer.complete(result);
      } catch (e) {
        completer.completeError(e);
      }
    });

    return completer.future;
  }
}

FutureOr<void> Function()? onWindowShouldClose;

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
