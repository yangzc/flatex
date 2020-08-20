///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flatex/box/column_box.dart';
import 'package:flatex/box/hline_box.dart';

import '../atom.dart';
import '../box.dart';
import '../tex_environment.dart';
import 'dart:ui';

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
    Size numSize = numBox.size;
    Size denomSize = denomBox.size;

    double width = 0;
    if(numSize.width > denomSize.width) {
      width = numSize.width;
    } else {
      width = denomSize.width;
    }
    ColumnBox columnBox = ColumnBox();
    columnBox.add(numBox);
    columnBox.add(HLineBox().setWidth(width + 10).setHeight(2));
    columnBox.add(denomBox);
    return columnBox;
  }
}
