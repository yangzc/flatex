///
/// Copyright (C) 2020 The flatex Project
/// @author jiangxl on 2020/08/19.
///
import 'package:flatex/atom.dart';
import 'package:flatex/macro/macro_info.dart';
import 'package:flatex/parse/tex_formula.dart';
import 'package:flatex/parse/tex_parser.dart';
import 'package:flatex/atom/char_atom.dart';
import 'package:flutter/material.dart';

class DotMacroInfo extends MacroInfo {
  @override
  Atom buildAtom(TexParser tp, List<String> args) {
    TeXFormula num = new TeXFormula(tp, args[0]);
    if (num.root == null)
      throw new Exception(
          "Both numerator and denominator of a fraction can't be empty!");
    Atom dot = CharAtom('·');
    dot.position = Alignment.topCenter;
    Atom atom = num.root;
    atom.addAroundAtom(dot);
    return atom;
  }
}
