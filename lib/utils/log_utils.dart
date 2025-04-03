import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LLog {
  static void log(String? msg, {String tag = "LatexLogUtils"}) {
    kDebugMode ? debugPrint("[$tag] ${msg ?? ""}") : null;
  }

  static void toast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
