class MathUtils {
  static num parse(String value) {
    return num.parse(value, (value) {
      return -1;
    });
  }
}
