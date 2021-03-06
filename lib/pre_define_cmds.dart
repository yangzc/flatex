///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
import 'dart:collection';

import 'package:flatex/macro/macro_info.dart';
import 'package:flutter/material.dart';

import 'macro/frac_macro.dart';
import 'macro/dot_macro.dart';
import 'macro/input_macro.dart';
import 'macro/sub_macro.dart';

class PreDefinedCommands {
  PreDefinedCommands._() {
    _init();
  }

  factory PreDefinedCommands() => _getInstance();

  static PreDefinedCommands get instance => _getInstance();
  static PreDefinedCommands _instance;
  HashMap<String, MacroInfo> _command = HashMap();

  static PreDefinedCommands _getInstance() {
    if (_instance == null) {
      _instance = PreDefinedCommands._();
    }
    return _instance;
  }

  void _init() {
    _command["frac"] = FracMacroInfo();
    _command["dot"] = DotMacroInfo();
    _command["input"] = InputMacroInfo();
    _command["_"] = SubMacroInfo(Alignment.bottomRight);
    _command["^"] = SubMacroInfo(Alignment.topRight);
  }

  void addMacroInfo(String cmd, MacroInfo macroInfo) {
    _command[cmd] = macroInfo;
  }

  MacroInfo getMacroInfo(String cmd) {
    return _command[cmd];
  }
}
