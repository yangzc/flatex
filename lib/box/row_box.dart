import 'package:flatex/atom/row_atom.dart';
import 'package:flatex/box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../atom.dart';
import '../tex_environment.dart';

class RowBox extends Box {
  TexEnvironment environment;
  RowAtom rowAtom;

  RowBox(this.environment, this.rowAtom);

  @override
  Widget buildWidget(BuildContext context) {
    List<Atom> atoms = rowAtom.children;
    List<Widget> children = List();
    if (atoms != null) {
      atoms.forEach((element) {
        Box box = element.createBox(environment);
        children.add(box.buildWidget(context));
      });
    }
    return Wrap(
      direction: Axis.horizontal,
      children: children,
    );
  }
}
