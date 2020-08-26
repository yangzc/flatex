import 'package:flatex/box.dart';
import 'package:flatex/tex_environment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

/// Copyright (C) 2020 The flutter_rtc_student Project
/// @author yangzc on 2020/08/26.

class DotBox extends Box {
  DotBox(TexEnvironment environment) : super(environment);

  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      child: SizedBox(
        child: CustomPaint(
          painter: _DotPainter(environment),
        ),
        width: 5,
        height: 5,
      ),
//      decoration: ShapeDecoration(
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.all(
//              Radius.circular(0),
//            ),
//            side: BorderSide(color: Colors.black, width: 0)),
//      ),
//      padding: EdgeInsets.only(bottom: 2),
    );
  }

  @override
  Size get size {
    return Size(5, 5);
  }
}

class _DotPainter extends CustomPainter {
  Paint _paint = Paint();
  TexEnvironment environment;

  _DotPainter(this.environment);

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = environment.textColor;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
