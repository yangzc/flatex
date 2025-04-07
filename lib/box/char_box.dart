///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///
import 'package:flatex/tex_environment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: true,
      ),
    );
    return buildSubWidget(
      context,
      Container(
        child: content,
      ),
    );
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
