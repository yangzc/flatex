///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///
import 'package:flatex/atom.dart';
import 'package:flatex/box.dart';
import 'package:flatex/box/row_box.dart';
import 'package:flatex/tex_environment.dart';

class RowAtom extends Atom {
  List<Atom> children = [];

  RowAtom(Atom atom) {
    if (atom is RowAtom) {
      children.addAll(atom.children);
    } else {
      children.add(atom);
    }
  }

  void add(Atom atom) {
    children.add(atom);
  }

  Atom last() {
    return children.last;
  }

  @override
  Box createBox(TexEnvironment environment) {
    RowBox box = RowBox(environment, this);

    children.forEach((element) {
      box.add(element.createBox(environment));
    });
    return box;
  }
}
