///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'package:flatex/atom.dart';
import 'package:flatex/atom/char_atom.dart';
import 'package:flatex/macro/macro_info.dart';
import 'package:flatex/pre_define_cmds.dart';
import 'package:flutter/widgets.dart';

import 'tex_formula.dart';

class TexParser {

  static const String ESCAPE = '\\';

  static const String L_GROUP = '{';
  static const String R_GROUP = '}';

  Characters characters;
  TeXFormula teXFormula;
  TexParser(parseString, this.teXFormula): characters = Characters(parseString);

  int _pos = 0;
  void parse() {
    int length = characters.length;
    String ch;
    while(_pos < length) {
      ch = characters.elementAt(_pos);
      switch(ch) {
        case ESCAPE: {
          _pos ++;
          String command = _getCommand();
          MacroInfo macroInfo = PreDefinedCommands.instance.getMacroInfo(command);
          if(macroInfo != null) {
            print(command);
            List<String> arguments = _getArguments();
            Atom atom = macroInfo.buildAtom(this, arguments);
            teXFormula?.add(atom);
          }
          break;
        }
        default:
          {
            teXFormula?.add(CharAtom(ch));
            _pos ++;
          }
      }
    }
  }

  String _getCommand() {
    String ch = characters.elementAt(_pos);
    String cmd = "";
    while(_pos < characters.length) {
      ch = characters.elementAt(_pos);
      if ((ch.codeUnitAt(0) < 'a'.codeUnitAt(0) || ch.codeUnitAt(0) > 'z'.codeUnitAt(0))
          && (ch.codeUnitAt(0) < 'A'.codeUnitAt(0) || ch.codeUnitAt(0) > 'Z'.codeUnitAt(0)))
        break;

      _pos++;
      cmd += ch;
    }
    return cmd;
  }

  /// 获取参数
  List<String> _getArguments() {
    List<String> args = List();
    while(_pos < characters.length) {
      String ch = characters.elementAt(_pos);
      if(ch != L_GROUP)
        break;
      String arg = getPairArgs(L_GROUP, R_GROUP);
      args.add(arg);
    }
    return args;
  }

  /// 获取参数匹配对
  String getPairArgs(String left, String right) {
    List<String> stack = List();
    int start = _pos;
    while(_pos < characters.length) {
      String ch = characters.elementAt(_pos);
      stack.add(ch);
      _pos ++;
      if(ch == right) {
        while(stack.isNotEmpty){
          String item = stack.removeLast();
          if(item == left) {
            break;
          }
        }
        if(stack.isEmpty) {
          String args = characters.toString().substring(start, _pos);
          if(args.length >= 2) {
            return args.substring(1, args.length -1);
          }
          return "";
        }
      }
    }
    return "";
  }
}