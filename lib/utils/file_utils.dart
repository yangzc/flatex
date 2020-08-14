import 'package:flutter/services.dart';

class FileUtils {

  static Future<String> readFile(String bundlePath) async {
    ByteData byteData = await rootBundle.load(bundlePath);
    return String.fromCharCodes(byteData.buffer.asUint8List());
  }

}