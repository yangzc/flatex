import 'package:flutter/services.dart';

class FontUtils {

  /// 动态加载字体
  static void loadFont(String font, String path) async {
    Future<ByteData> byteData = rootBundle.load(path);
    FontLoader fontLoader = FontLoader(font);
    fontLoader.addFont(byteData);
    await fontLoader.load();
  }
}