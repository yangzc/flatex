///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Box {
  double _width = 0.0;
  double _height = 0.0;

  double get width => _width;
  double get height => _height;
  List<Box> children = List<Box>();
  Box parent;
  Box elderParent;
  int depth = 0; //深度

  Alignment position;
  List<Box> aroundBox = List<Box>();

  void add(Box b) {
    children.add(b);
    b.parent = this;
    b.elderParent = elderParent;
  }

  void insert(int pos, Box b) {
    children[pos] = b;
    b.parent = this;
    b.elderParent = elderParent;
  }

  Box setWidth(double width) {
    this._width = width;
    return this;
  }

  Box setHeight(double height) {
    this._height = height;
    return this;
  }

  void addAroundBox(Box b) {
    aroundBox.add(b);
  }

  Widget buildWidget(BuildContext context);

  Widget buildSubWidget(BuildContext context, Widget content) {
    List<Widget> stackItems = List();
    stackItems.add(content);

    aroundBox.forEach((element) {
      stackItems.add(Container(
        child: element.buildWidget(context),
        alignment: Alignment.topLeft,
      ));
    });
    return Container(
      color: Colors.red,
      width: 200,
      height: 100,
      child: Stack(
        children: stackItems,
      ),
    );
  }
}
