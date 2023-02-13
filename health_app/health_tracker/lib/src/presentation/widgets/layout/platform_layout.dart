// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

class PlatformLayout extends StatelessWidget {
  final WidgetBuilder iosFcn;
  final WidgetBuilder androidFcn;

  const PlatformLayout({
    Key? key,
    required this.iosFcn,
    required this.androidFcn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? iosFcn(context) : androidFcn(context);
  }
}
