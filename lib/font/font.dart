///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'char_font.dart';

class Font {
  int fontId;
  String fontName;
  num space;
  String path;
  List<CharFont> charFonts = [];


  Font(this.fontId, this.path, this.fontName, this.space);
}
