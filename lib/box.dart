import 'package:flutter/cupertino.dart';

abstract class Box {

  num width = 0;
  num height = 0;

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

  Widget buildWidget(BuildContext context);

}