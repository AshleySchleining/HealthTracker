// Flutter imports:
import 'package:flutter/material.dart';


class DeviceTypeLayout extends StatelessWidget {
  final WidgetBuilder mobileFcn;
  final WidgetBuilder? tabletFcn;
  final WidgetBuilder? desktopFcn;

  const DeviceTypeLayout({
    Key? key,
    required this.mobileFcn,
    this.tabletFcn,
    this.desktopFcn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (ctx, sizing) {
      if (sizing.deviceType == DeviceType.tablet && tabletFcn != null) {
        return tabletFcn!(ctx);
      }

      if (sizing.deviceType == DeviceType.desktop && desktopFcn != null) {
        return desktopFcn!(ctx);
      }

      return mobileFcn(ctx);
    });
  }
}
