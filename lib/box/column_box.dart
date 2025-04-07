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
    List<Widget> items = [];
    children.forEach((element) {
      Widget item = element.buildWidget(context);
      items.add(item);
    });
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
      child: Column(
        children: items,
      ),
    );
  }

  @override
  Size get size {
    double width = 0, height = 0;
    children.forEach((element) {
      Size itemSize = element.size;
      if (itemSize.width > width) {
        width = itemSize.width;
      }
      height += itemSize.height;
    });
    return Size(width, height);
  }

  @override
  void onBoxSizeChange(Size size) {
    notifySizeChange();
  }
}
