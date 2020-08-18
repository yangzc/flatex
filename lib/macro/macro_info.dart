///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'dart:collection';

import 'package:flatex/atom.dart';
import 'package:flatex/parse/tex_parser.dart';

abstract class MacroInfo {

  Atom buildAtom(TexParser parser, List<String> args);
}
