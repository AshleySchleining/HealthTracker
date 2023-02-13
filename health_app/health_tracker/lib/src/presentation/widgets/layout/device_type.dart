// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_app_template/src/core/constants.dart';

enum DeviceType { mobile, tablet, desktop }

DeviceType getDeviceType(MediaQueryData mediaQuery) {
  final double shortestSide = mediaQuery.size.shortestSide;

  if (shortestSide > Constants.desktopBreakpoint) {
    return DeviceType.desktop;
  } else if (shortestSide > Constants.tabletBreakpoint) {
    return DeviceType.tablet;
  }
  return DeviceType.mobile;
}
