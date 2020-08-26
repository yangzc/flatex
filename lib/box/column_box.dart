///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///
import 'package:flatex/box.dart';
import 'package:flatex/tex_environment.dart';
import 'package:flutter/cupertino.dart';

class ColumnBox extends Box {
  ColumnBox(TexEnvironment environment) : super(environment);

  @override
  Widget buildWidget(BuildContext context) {
    List<Widget> items = List();
    if (children != null) {
      children.forEach((element) {
        Widget item = element.buildWidget(context);
        items.add(item);
      });
    }
    return Column(
      children: items,
    );
  }

  @override
  Size get size {
    double width = 0, height = 0;
    if (children != null) {
      children.forEach((element) {
        Size itemSize = element.size;
        if (itemSize.width > width) {
          width = itemSize.width;
        }
        height += itemSize.height;
      });
    }
    return Size(width, height);
  }
}
