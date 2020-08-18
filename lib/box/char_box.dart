import 'package:flutter/cupertino.dart';

import '../box.dart';

class CharBox extends Box {
  String text;

  CharBox(this.text);
  @override
  Widget buildWidget(BuildContext context) {
    throw UnimplementedError();
  }

}