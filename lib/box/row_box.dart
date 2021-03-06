///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///
import 'package:flatex/atom/row_atom.dart';
import 'package:flatex/box.dart';
import 'package:flutter/cupertino.dart';

import '../tex_environment.dart';

class RowBox extends Box {
  RowAtom rowAtom;

  RowBox(TexEnvironment texEnvironment) : super(texEnvironment);

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
      crossAxisAlignment: WrapCrossAlignment.end,
      direction: Axis.horizontal,
      children: items,
    );
  }

  @override
  Size get size {
    double width = 0, height = 0;
    if (children != null) {
      children.forEach((element) {
        Size itemSize = element.size;
        width += itemSize.width;
        if (itemSize.height > height) {
          height = itemSize.height;
        }
      });
    }
    return Size(width, height);
  }
}
