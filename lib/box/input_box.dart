/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flatex/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../tex_environment.dart';

class InputBox extends Box {
  final TexEnvironment environment;
  InputBox(this.environment);

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

  @override
  Size get size {
    return Size(100, 50);
  }
}
