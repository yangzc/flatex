///
/// Copyright (C) 2020 The flatex Project
/// @author jiangxl on 2020/08/19.
///
import 'package:flatex/atom.dart';
import 'package:flatex/macro/macro_info.dart';
import 'package:flatex/parse/tex_formula.dart';
import 'package:flatex/parse/tex_parser.dart';
import 'package:flutter/material.dart';

class SubMacroInfo extends MacroInfo {
  Alignment position = Alignment.center;
  @override
  SubMacroInfo(this.position);
  Atom buildAtom(TexParser tp, List<String> args) {
    TeXFormula num = new TeXFormula(tp, args[0]);
    Atom atom = num.root;
    atom.position = position;
    return atom;
  }
}
