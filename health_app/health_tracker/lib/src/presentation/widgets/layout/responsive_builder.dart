// Flutter imports:
import 'package:flutter/material.dart';
import 'package:health_tracker/src/presentation/widgets/layout/device_type.dart';
import 'package:health_tracker/src/presentation/widgets/layout/sizing_information.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  const ResponsiveBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (ctx, boxSizing) {
      final sizing = SizingInformation(
        orientation: mediaQuery.orientation,
        deviceType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
      );

      return builder(ctx, sizing);
    });
  }
}
