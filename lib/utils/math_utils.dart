///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
class MathUtils {
  static num parse(String value) {
    return num.parse(value, (value) {
      return -1;
    });
  }
}
