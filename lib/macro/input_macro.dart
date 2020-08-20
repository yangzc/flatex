import 'package:flatex/atom/input_atom.dart';

/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flatex/macro/macro_info.dart';
import 'package:flatex/parse/tex_parser.dart';
import 'package:flatex/atom.dart';

class InputMacroInfo extends MacroInfo {
  @override
  Atom buildAtom(TexParser parser, List<String> args) {
    return InputAtom();
  }
}
