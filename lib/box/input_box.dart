/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flatex/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputBox extends Box {
  @override
  Widget buildWidget(BuildContext context) {
    print("ddd");
    return Container(
      width: 100,
      child: TextField(
        readOnly: false,
      ),
    );
  }
}
