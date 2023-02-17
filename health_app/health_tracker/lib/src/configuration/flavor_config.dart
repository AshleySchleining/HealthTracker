import 'package:health_tracker/src/configuration/environment/environment.dart';

class FlavorConfig {
  final String environmentTitle;
  final EnvironmentType enviromentType;

  FlavorConfig({
    required this.enviromentType,
    this.environmentTitle = 'default',
  });
}
