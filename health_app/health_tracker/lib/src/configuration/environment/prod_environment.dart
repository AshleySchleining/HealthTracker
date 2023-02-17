// This is the place to put production environment specific settings.
import 'package:health_tracker/src/configuration/environment/environment.dart';

class ProductionEnvironmentValues extends EnvironmentSpecificValues {
  @override
  String get titleQualifier => "PROD";
}
