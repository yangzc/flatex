///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
///

import 'dart:math';

import 'package:flatex/listener/i_listeners.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../box.dart';
import '../tex_environment.dart';

class HLineBox extends Box {
  HLineBox(TexEnvironment texEnvironment) : super(texEnvironment);

  @override
  Widget buildWidget(BuildContext context) {
    return HLineWidget(this);
  }

  @override
  void onBoxSizeChange(Size size) {
    notifySizeChange(parentSize: size);
  }
}

class HLineWidget extends StatefulWidget {
  final HLineBox hLineBox;

  const HLineWidget(this.hLineBox);

  @override
  State<StatefulWidget> createState() {
    return _HLineWidgetState();
  }
}

class _HLineWidgetState extends State<HLineWidget>
    implements IBoxSizeChangeListener {
  double _parentSize = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HLineWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.hLineBox.getListeners().isEmpty) {
      widget.hLineBox.addSizeChangeListener(this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2, bottom: 2),
      width: max(_parentSize, widget.hLineBox.size.width),
      height: widget.hLineBox.size.height,
      color: widget.hLineBox.environment.textColor,
    );
  }

  @override
  void onBoxSizeChange(Size size) {
    setState(() {
      _parentSize = size.width;
    });
  }
}
