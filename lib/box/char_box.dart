///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../box.dart';

class CharBox extends Box {
  String text;

  CharBox(this.text);

  @override
  Widget buildWidget(BuildContext context) {
    Widget content = Text(
      text,
      style: _buildTextStyle(),
    );

    return buildSubWidget(context, content);
  }

  TextStyle _buildTextStyle() {
    return TextStyle(color: Colors.blue, fontSize: fontSize);
  }

  @override
  Size get size {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: TextStyle(fontSize: fontSize)),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}

//class _Painter extends CustomPainter {
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    TextPainter(
//        text: TextSpan(
//            text: '文字位置与 layout 的最大最小宽度有关',
//            style: TextStyle(fontSize: 16.0, color: Colors.black)),
//        textDirection: TextDirection.rtl)
//      ..layout(maxWidth: 100, minWidth: 100)
//      ..paint(canvas, Offset(0.0, 90.0));
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return false;
//  }
//}
