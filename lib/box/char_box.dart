///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../box.dart';

class CharBox extends Box {
  String text;
  double fontSize;

  CharBox(this.text, this.fontSize);

  @override
  Widget buildWidget(BuildContext context) {
    Widget content = Text(
      text,
      style: TextStyle(color: Colors.blue, fontSize: fontSize),
    );
    return buildSubWidget(
        context,
        Container(
          child: content,
        ));
  }
}
