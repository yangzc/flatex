import 'dart:math';

///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Box {
  double _width = 0.0;
  double _height = 0.0;
  double fontSize = 16.0;

  Size get size {
    return Size(_width, _height);
  }

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
    double width = size.width;
    double height = size.height;
    //记录多出来的部分
    double offsetTop = 0.0;
    double offsetBottom = 0.0;
    //content的Alignment
    Alignment contentAlignment = Alignment.center;

    aroundBox.forEach((element) {
      element.fontSize = 8;
      if (element.position.x != 0) {
        // 左或右
        width += element.size.width;
      } else {
        // 横向中间
        width = max(element.size.width, width);
      }

      if (element.position.y == 1) {
        // 下
        height += element.size.height;
        offsetBottom = max(offsetBottom, element.size.height);
        if (contentAlignment == Alignment.bottomCenter) {
          contentAlignment = Alignment.center;
        } else {
          contentAlignment = Alignment.topCenter;
        }
      } else if (element.position.y == -1) {
        // 上
        height += element.size.height;
        offsetTop = max(offsetTop, element.size.height);
        if (contentAlignment == Alignment.topCenter) {
          contentAlignment = Alignment.center;
        } else {
          contentAlignment = Alignment.bottomCenter;
        }
      } else {
        // 竖向中间
        height = max(element.size.height, height);
      }
    });

    // 上下都有偏移，只留一个
    if (offsetTop > offsetBottom) {
      offsetTop -= offsetBottom;
      offsetBottom = 0;
    } else {
      offsetBottom -= offsetTop;
      offsetTop = 0;
    }

    List<Widget> stackItems = List();
    stackItems.add(Container(
      width: width,
      height: height,
      child: content,
      alignment: contentAlignment,
      // color: Colors.yellow,
    ));

    aroundBox.forEach((element) {
      stackItems.add(Container(
        width: width,
        height: height,
        child: element.buildWidget(context),
        alignment: element.position,
        // color: Colors.yellow,
      ));
    });

    return Container(
      color: Colors.red,
      child: Stack(
        children: stackItems,
      ),
    );
  }
}
