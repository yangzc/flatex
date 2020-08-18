///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///
import 'package:flatex/box/column_box.dart';
import 'package:flatex/box/hline_box.dart';

import '../atom.dart';
import '../box.dart';
import '../tex_environment.dart';

class FractionAtom extends Atom {
  Atom num, denom;

  FractionAtom(this.num, this.denom);

  @override
  Box createBox(TexEnvironment environment) {
    Box numBox = num.createBox(environment);
    Box denomBox = denom.createBox(environment);

    ColumnBox columnBox = ColumnBox();
    columnBox.add(numBox);
    columnBox.add(HLineBox().setWidth(30).setHeight(2));
    columnBox.add(denomBox);
    return columnBox;
  }
}
