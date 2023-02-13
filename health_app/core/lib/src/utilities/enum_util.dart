class EnumUtil {
  static bool _isEnumItem(enumItem) {
    final splitEnum = enumItem.toString().split('.');
    return splitEnum.length > 1 &&
        splitEnum[0] == enumItem.runtimeType.toString();
  }

  static String convertToString(dynamic enumItem) {
    assert(enumItem != null);
    assert(_isEnumItem(enumItem),
        '$enumItem of type ${enumItem.runtimeType.toString()} is not an enum item');
    final _tmp = enumItem.toString().split('.')[1];
    return _tmp;
  }

  static T? fromString<T>(
    List<T> enumValues,
    String? value,
  ) {
    try {
      if (value == null) {
        return null;
      }
      return enumValues.singleWhere((enumItem) =>
          EnumUtil.convertToString(enumItem).toLowerCase() ==
          value.toLowerCase());
    } on StateError catch (_) {
      return null;
    }
  }
}
