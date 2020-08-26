///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flatex/tex_environment.dart';

import '../box.dart';

class CharBox extends Box {
  String text;

  CharBox(TexEnvironment environment, this.text) : super(environment);

  @override
  Widget buildWidget(BuildContext context) {
    Widget content = Text(
      text,
      style: _buildTextStyle(),
      textHeightBehavior: TextHeightBehavior(
          applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
    );
    return buildSubWidget(
        context,
        Container(
          child: content,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
                side: BorderSide(color: Colors.black, width: 0)),
          ),
        ));
  }

  TextStyle _buildTextStyle() {
    return TextStyle(
      color: environment.textColor,
      height: 1.0,
      fontSize: environment.textSize,
    );
  }

  @override
  Size get size {
    return measureFontSize(text, environment.textSize);
  }
}

class _Painter extends CustomPainter {

  final String text;
  _Painter(this.text);

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter(
        text: TextSpan(
            text: text, style: TextStyle(fontSize: 16.0, color: Colors.black)),
        textDirection: TextDirection.rtl)
      ..layout(maxWidth: 100, minWidth: 100)
      ..paint(canvas, Offset(0.0, 90.0));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
