///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flutter/cupertino.dart';

abstract class Box {

  double _width = 0.0;
  double _height = 0.0;

  double get width => _width;
  double get height => _height;
  List<Box> children = List<Box>();
  Box parent;
  Box elderParent;

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

  Widget buildWidget(BuildContext context);

}