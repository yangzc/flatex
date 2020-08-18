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
    return Text(
      text,
      style: TextStyle(color: Colors.blue),
    );
  }
}
