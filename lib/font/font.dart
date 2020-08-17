import 'char_font.dart';

class Font {
  int fontId;
  String fontName;
  num space;
  String path;
  List<CharFont> charFonts = List();


  Font(this.fontId, this.path, this.fontName, this.space);
}