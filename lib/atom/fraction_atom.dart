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
  int depth = 0;
  FractionAtom(this.num, this.denom);

  @override
  Box createBox(TexEnvironment environment) {
    if(num is FractionAtom) {
      (num as FractionAtom).depth = depth + 1;
    }
    if(denom is FractionAtom) {
      (denom as FractionAtom).depth = depth + 1;
    }

    Box numBox = num.createBox(environment);
    Box denomBox = denom.createBox(environment);

    print(depth);
    ColumnBox columnBox = ColumnBox();
    columnBox.add(numBox);
    columnBox.add(HLineBox().setWidth(50.0 - depth * 10).setHeight(2));
    columnBox.add(denomBox);
    return columnBox;
  }
}
