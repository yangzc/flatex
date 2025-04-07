///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flatex/box/column_box.dart';
import 'package:flatex/box/hline_box.dart';

import '../atom.dart';
import '../box.dart';
import '../tex_environment.dart';

class FractionAtom extends Atom {
  Atom num, devNum;
  int depth = 0;

  FractionAtom(this.num, this.devNum);

  @override
  Box createBox(TexEnvironment environment) {
    if (num is FractionAtom) {
      (num as FractionAtom).depth = depth + 1;
    }
    if (devNum is FractionAtom) {
      (devNum as FractionAtom).depth = depth + 1;
    }

    Box numBox = num.createBox(environment);
    Box devNumBox = devNum.createBox(environment);
    var hLineBox = HLineBox(environment).setWidth(20).setHeight(1);
    ColumnBox columnBox = ColumnBox(environment);
    columnBox.add(numBox);
    columnBox.add(hLineBox, listen: false);
    columnBox.addSizeChangeListener(hLineBox);
    columnBox.add(devNumBox);
    return columnBox;
  }
}
