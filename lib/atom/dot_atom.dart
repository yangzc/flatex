import 'package:flatex/atom.dart';
import 'package:flatex/box.dart';
import 'package:flatex/box/dot_box.dart';
import 'package:flatex/tex_environment.dart';

/// Copyright (C) 2020 The flutter_rtc_student Project
/// @author yangzc on 2020/08/26.

class DotAtom extends Atom {

  @override
  Box createBox(TexEnvironment environment) {
    return DotBox(environment);
  }

}