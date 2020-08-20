///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../box.dart';

class HLineBox extends Box {
  HLineBox();

  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      height: size.height,
      color: Colors.black,
      width: size.width,
    );
  }
}
