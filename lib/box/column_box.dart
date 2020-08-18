///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///
import 'package:flatex/box.dart';
import 'package:flatex/box/hline_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class ColumnBox extends Box {

  @override
  Widget buildWidget(BuildContext context) {
    List<Widget> items = List();
    print(depth);
    if(children != null) {
      children.forEach((element) {
        if(element is ColumnBox) {
          element.depth = depth + 1;
        }
        if(element is HLineBox) {
          element.setWidth(30.0 - depth * 10);
        }
        Widget item = element.buildWidget(context);
        items.add(item);
      });
    }
    return Column(children: items,);
  }
}