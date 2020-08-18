import 'dart:collection';

import 'package:flatex/macro/macro_info.dart';

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
    _command["frac"] = null;
  }

  MacroInfo getMacroInfo(String cmd) {
    return _command[cmd];
  }
}
