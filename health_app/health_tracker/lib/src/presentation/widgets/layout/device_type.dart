// Flutter imports:
import 'package:flutter/material.dart';
import 'package:health_tracker/src/core/constants.dart';

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
