///
/// Copyright (C) 2020 The flatex Project
/// @author jiangxl on 2020/08/19.
///
import 'package:flatex/box/column_box.dart';

import '../atom.dart';
import '../box.dart';
import '../tex_environment.dart';

class UpperAtom extends Atom {
  Atom num;
  Atom upper;
  UpperAtom(this.num, this.upper);

  @override
  Box createBox(TexEnvironment environment) {
    Box numBox = num.createBox(environment);
    Box upperBox = upper.createBox(environment.smallSize(10));

    ColumnBox columnBox = ColumnBox();
    columnBox.add(upperBox);
    columnBox.add(numBox);
    return columnBox;
  }
}
