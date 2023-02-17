import 'package:health_tracker/src/configuration/environment/environment.dart';

// This is the place to put development environment specific settings.

class DevelopmentEnvironmentValues extends EnvironmentSpecificValues {
  @override
  String get titleQualifier => "DEV";
}
