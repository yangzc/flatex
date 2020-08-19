///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///
import 'package:flatex/atom/row_atom.dart';
import 'package:flatex/box.dart';
import 'package:flutter/cupertino.dart';

class RowBox extends Box {
  RowAtom rowAtom;

  RowBox();

  @override
  Widget buildWidget(BuildContext context) {
    List<Widget> items = List();
    if (children != null) {
      children.forEach((element) {
        Widget item = element.buildWidget(context);
        items.add(item);
      });
    }
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.horizontal,
      children: items,
    );
  }
}
