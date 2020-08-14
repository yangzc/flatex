import 'package:flatex/tex_environment.dart';

import 'box.dart';

abstract class Atom {

  /// 创建box
  Box createBox(TexEnvironment environment);
}