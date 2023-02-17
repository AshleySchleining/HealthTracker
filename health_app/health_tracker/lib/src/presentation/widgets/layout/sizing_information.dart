// Flutter imports:
import 'package:flutter/material.dart';
import 'package:health_tracker/src/presentation/widgets/layout/device_type.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation(
      {required this.orientation,
      required this.deviceType,
      required this.screenSize,
      required this.localWidgetSize});
}
