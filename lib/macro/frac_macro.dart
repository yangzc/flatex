///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flatex/atom.dart';
import 'package:flatex/atom/fraction_atom.dart';
import 'package:flatex/macro/macro_info.dart';
import 'package:flatex/parse/tex_formula.dart';
import 'package:flatex/parse/tex_parser.dart';

class FracMacroInfo extends MacroInfo {

  @override
  Atom buildAtom(TexParser tp, List<String> args) {
    TeXFormula num = new TeXFormula(tp, args[0]);
    TeXFormula denom = new TeXFormula(tp, args[1]);
    if (num.root == null || denom.root == null)
      throw new Exception("Both numerator and denominator of a fraction can't be empty!");
    return FractionAtom(num.root, denom.root);
  }
}
