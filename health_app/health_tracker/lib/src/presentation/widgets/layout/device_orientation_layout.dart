// Flutter imports:
import 'package:flutter/material.dart';

class DeviceOrientationLayout extends StatelessWidget {
  final WidgetBuilder portraitFcn;
  final WidgetBuilder? landscapeFcn;

  const DeviceOrientationLayout({
    Key? key,
    required this.portraitFcn,
    this.landscapeFcn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape && landscapeFcn != null) {
      return landscapeFcn!(context);
    }
    return portraitFcn(context);
  }
}
