import 'package:flatex/atom.dart';
import 'package:flatex/atom/row_atom.dart';
import 'package:flatex/parse/tex_parser.dart';
import 'package:flutter/cupertino.dart';

class TeXFormula {
  Atom root;
  TexParser _parser; //自己的解析器

  TeXFormula.parse(String parseString) {
    TeXFormula(null, parseString);
  }

  /// parser: 上级解析器
  TeXFormula(TexParser parser, String parseString) {
    _parser = TexParser(parseString, this);
    _parser.parse();
  }

  void add(Atom atom) {
    if (root == null) {
      root = atom;
    } else {
      if (!(root is RowAtom)) {
        root = RowAtom(root);
      }
      RowAtom row = root;
      row.add(atom);
    }
  }
}
