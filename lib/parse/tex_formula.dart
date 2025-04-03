///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flatex/atom.dart';
import 'package:flatex/atom/row_atom.dart';
import 'package:flatex/parse/tex_parser.dart';

class TeXFormula {
  Atom? root;
  late TexParser _parser; //自己的解析器

  TeXFormula.parse(String parseString) : this(null, parseString);

  /// parent: 上级解析器
  TeXFormula(TexParser? parent, String parseString) {
    _parser = TexParser(parseString, this);
    _parser.parse();
  }

  void add(Atom atom) {
    if (root == null) {
      root = atom;
    }
    if (!(root is RowAtom)) {
      root = RowAtom(root!);
    }
    RowAtom row = root as RowAtom;
    row.add(atom);
  }

  Atom last() {
    if (!(root is RowAtom)) {
      root = RowAtom(root!);
    }
    RowAtom row = root as RowAtom;
    return row.last();
  }
}
