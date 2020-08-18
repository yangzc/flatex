///
/// Copyright (C) 2020 The flatex Project
/// @author yangzc on 2020/08/18.
class TexEnvironment {
  double fontSize = 14;

  TexEnvironment(this.fontSize);

  TexEnvironment smallSize([double small = 2.0]) {
    double fontSize = this.fontSize;
    fontSize -= small;
    if (fontSize < 6.0) {
      fontSize = 6.0;
    }
    return TexEnvironment(fontSize);
  }
}
