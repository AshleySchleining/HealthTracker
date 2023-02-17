import 'package:health_tracker/src/configuration/environment/environment.dart';

// This is the place to put QA environment specific settings.
class QAEnvironmentValues extends EnvironmentSpecificValues {
  @override
  String get titleQualifier => "QA";
}
