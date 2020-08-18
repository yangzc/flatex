import 'package:flatex/box/char_box.dart';

import '../atom.dart';
import '../box.dart';
import '../tex_environment.dart';

class CharAtom extends Atom {
  String text;

  CharAtom(this.text);

  @override
  Box createBox(TexEnvironment environment) {
    return CharBox(text);
  }
}
