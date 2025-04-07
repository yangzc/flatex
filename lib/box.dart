import 'dart:math';

import 'package:flatex/listener/i_listeners.dart';
///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tex_environment.dart';

abstract class Box implements IBoxSizeChangeListener {
  double _width = 0.0;
  double _height = 0.0;
  List<IBoxSizeChangeListener> _sizeChangeListeners = [];

  void addSizeChangeListener(IBoxSizeChangeListener listener) {
    _sizeChangeListeners.add(listener);
  }

  List<IBoxSizeChangeListener> getListeners() {
    return _sizeChangeListeners;
  }

  @override
  void onBoxSizeChange(Size size) {}

  void notifySizeChange({Size? parentSize}) {
    _sizeChangeListeners.forEach((element) {
      element.onBoxSizeChange(parentSize ?? this.size);
    });
  }

  TexEnvironment environment;

  Box(this.environment);

  Size get size {
    return Size(_width, _height);
  }

  List<Box> children = <Box>[];
  Box? parent;
  Box? elderParent;
  int depth = 0; //深度

  Alignment position = Alignment.center;
  List<Box> aroundBox = <Box>[];

  void add(Box b, {listen = true}) {
    children.add(b);
    b.parent = this;
    b.elderParent = elderParent;
    if (listen) {
      b.addSizeChangeListener(this);
    }
  }

  void insert(int pos, Box b, {listen = true}) {
    children[pos] = b;
    b.parent = this;
    b.elderParent = elderParent;
    if (listen) {
      b.addSizeChangeListener(this);
    }
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
//    double offsetTop = 0.0;
//    double offsetBottom = 0.0;
    //content的Alignment
    Alignment contentAlignment = Alignment.center;

    aroundBox.forEach((element) {
      Size itemSize = element.size;
      if (element.position.x != 0) {
        // 左或右
        width += itemSize.width;
      } else {
        // 横向中间
        width = max(itemSize.width, width);
      }

      if (element.position.y == 1) {
        // 下
        height +=
            itemSize.height - ((element.position.x == 0) ? 0 : itemSize.height);
//        offsetBottom = max(offsetBottom, element.size.height);
      } else if (element.position.y == -1) {
        // 上
        height +=
            itemSize.height - ((element.position.x == 0) ? 0 : itemSize.height);
//        print(itemSize.height);
//        offsetTop = max(offsetTop, element.size.height);
      } else {
        // 竖向中间
        height = max(itemSize.height, height);
      }
      double x = max(min(contentAlignment.x - element.position.x, 1), -1);
      double y = max(min(contentAlignment.y - element.position.y, 1), -1);
      contentAlignment = Alignment(x, y);
    });

    // 上下都有偏移，只留一个
//    if (offsetTop > offsetBottom) {
//      offsetTop -= offsetBottom;
//      offsetBottom = 0;
//    } else {
//      offsetBottom -= offsetTop;
//      offsetTop = 0;
//    }

    List<Widget> stackItems = [];

    aroundBox.forEach((element) {
      stackItems.add(Container(
        width: width,
        height: height,
        child: Container(
          child: element.buildWidget(context),
//          color: Colors.red,
        ),
        alignment: element.position,
        // color: Colors.yellow,
      ));
    });

    stackItems.add(Container(
      width: width,
      height: height,
      child: content,
      alignment: contentAlignment,
      // color: Colors.yellow,
    ));

    return Container(
      child: Stack(
        children: stackItems,
      ),
    );
  }

  Size measureFontSize(String text, double fontSize) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(fontSize: fontSize, height: 1.0),
        ),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
