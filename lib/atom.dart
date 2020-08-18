///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flatex/tex_environment.dart';

import 'box.dart';

abstract class Atom {

  /// 创建box
  Box createBox(TexEnvironment environment);
}