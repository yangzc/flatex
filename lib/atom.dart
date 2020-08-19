///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flatex/tex_environment.dart';
import 'package:flutter/material.dart';

import 'box.dart';

abstract class Atom {
  Alignment position = Alignment.center;
  List<Atom> aroundList = List();

  /// 附加环绕atom
  void addAroundAtom(Atom atom) {
    aroundList.add(atom);
  }

  /// 创建box
  Box createBox(TexEnvironment environment);

  /// 附加环绕Box
  void addAroundBox(Box centerBox, TexEnvironment environment) {
    aroundList.forEach((element) {
      Box aroundBox = element.createBox(environment);
      aroundBox.position = element.position;
      centerBox.addAroundBox(aroundBox);
    });
  }
}
