import 'package:flatex/atom.dart';
import 'package:flatex/atom/fraction_atom.dart';
import 'package:flatex/macro/macro_info.dart';
import 'package:flatex/parse/tex_formula.dart';
import 'package:flatex/parse/tex_parser.dart';

class Frac extends MacroInfo {

  @override
  Atom buildAtom(TexParser tp, List<String> args) {
    print(args[0]);
    print(args[1]);
    TeXFormula num = new TeXFormula(tp, args[0]);
    TeXFormula denom = new TeXFormula(tp, args[1]);
    if (num.root == null || denom.root == null)
      throw new Exception("Both numerator and denominator of a fraction can't be empty!");
    return FractionAtom(num.root, denom.root);
  }
}
