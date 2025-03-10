///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flatex/font/char_font.dart';
import 'package:flatex/font/font.dart';
import 'package:xml/xml.dart';

import '../utils/file_utils.dart';
import '../utils/math_utils.dart';

class FLatexFont {

  late XmlNode _root;
  List<String> _fontNames = [];
  List<Font> _fonts = [];

  void init() async {
    XmlDocument document = XmlDocument.parse(await FileUtils.readFile(""));
    _root = document.root;
  }

  void parseFont() async {
    XmlElement? element = _root.getElement("FontDescriptions");
    if(element?.children != null) {
      element?.children.forEach((XmlNode node) async {
        String include = node.getAttribute("include") ?? "";
        await _parseFontFile(include);
      });
    }
  }

  Future<void> _parseFontFile(String include) async {
    String path = "";
    XmlDocument document = XmlDocument.parse(await FileUtils.readFile(path));
    XmlElement? element = document.rootElement;
    String name = element.getAttribute("name") ?? "";
    String id = element.getAttribute("id") ?? "";
    if(_fontNames.contains(id))
      return;

    _fontNames.add(id);
    String space = element.getAttribute("space") ?? "";
    Font font = Font(_fontNames.indexOf(id), path, name, MathUtils.parse(space));
    List<CharFont> charFonts = [];
    element.children.forEach((XmlNode node) {
      String code = node.getAttribute("code") ?? "";
      String width = node.getAttribute("width") ?? "";
      String height = node.getAttribute("height") ?? "";
      CharFont charFont = CharFont(int.parse(code), MathUtils.parse(width),
          MathUtils.parse(height));
      charFonts.add(charFont);
    });
    font.charFonts = charFonts;
    _fonts.add(font);
  }
}
