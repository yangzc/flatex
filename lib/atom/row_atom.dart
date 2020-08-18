import 'package:flatex/atom.dart';
import 'package:flatex/box.dart';
import 'package:flatex/box/row_box.dart';
import 'package:flatex/tex_environment.dart';

class RowAtom extends Atom {

  List<Atom> children = List();

  RowAtom(Atom atom) {
    if(atom != null) {
      if(atom is RowAtom) {
        children.addAll(atom.children);
      } else {
        children.add(atom);
      }
    }
  }

  void add(Atom atom) {
    children.add(atom);
  }

  @override
  Box createBox(TexEnvironment environment) {
    return RowBox(environment, this);
  }

}