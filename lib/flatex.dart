///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'atom.dart';
import 'box.dart';
import 'parse/tex_formula.dart';
import 'tex_environment.dart';

class FLatex extends StatelessWidget {
  final String latex;
  final TexEnvironment texEnvironment;

  FLatex(this.texEnvironment, this.latex);

  @override
  Widget build(BuildContext context) {
    TeXFormula formula = TeXFormula.parse(latex);
    Atom root = formula.root;
    Widget child;
    if (root != null) {
      Box box = root.createBox(texEnvironment);
      child = box.buildWidget(context);
    } else {
      print("empty!");
    }
    return child ??
        Text(
          "Empty",
          style: TextStyle(color: Colors.red),
        );
  }
}
