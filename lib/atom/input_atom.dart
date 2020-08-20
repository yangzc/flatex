import 'package:flatex/atom.dart';
import 'package:flatex/box.dart';
import 'package:flatex/box/input_box.dart';
import 'package:flatex/tex_environment.dart';

/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
class InputAtom extends Atom {

  @override
  Box createBox(TexEnvironment environment) {
    return InputBox();
  }
}