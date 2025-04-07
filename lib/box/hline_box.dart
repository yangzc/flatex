///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../box.dart';
import '../tex_environment.dart';

class HLineBox extends Box {
  HLineBox(TexEnvironment texEnvironment) : super(texEnvironment) {}

  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2, bottom: 2),
      width: size.width,
      height: size.height,
      color: environment.textColor,
    );
  }
}
