import '../atom.dart';
import '../box.dart';
import '../tex_environment.dart';

class FractionAtom extends Atom {
  Atom num, denom;
  FractionAtom(this.num, this.denom);

  @override
  Box createBox(TexEnvironment environment) {
    return null;
  }
}