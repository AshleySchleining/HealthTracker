// Flutter imports:
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  navigateToNamed(String name, {Object? arguments}) {
    Navigator.of(this).pushNamed(name, arguments: arguments);
  }

  pop() {
    Navigator.of(this).pop();
  }
}
