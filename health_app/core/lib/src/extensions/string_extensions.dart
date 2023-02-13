extension StringExtensions on String {
  bool boolTryParse() {
    if (isEmpty) return false;

    bool result = false;

    var uppercaseData = toUpperCase();

    const trueValue = 'TRUE';
    const trueAbbreviatedValue = 'T';
    const yesValue = 'YES';
    const onValue = 'ON';

    if (uppercaseData == trueValue ||
        uppercaseData == trueAbbreviatedValue ||
        uppercaseData == yesValue ||
        uppercaseData == onValue) {
      result = true;
    }
    return result;
  }

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
