import 'package:health_tracker/src/configuration/environment/dev_environment.dart';
import 'package:health_tracker/src/configuration/environment/prod_environment.dart';
import 'package:health_tracker/src/configuration/environment/qa_environment.dart';
import 'package:health_tracker/src/configuration/flavor_config.dart';

enum EnvironmentType {
  prod,
  qa,
  dev,
}

abstract class EnvironmentSpecificValues {
  // This would be the place to add properties that can change depending upon environment
  String get titleQualifier;
}

abstract class Environment {
  FlavorConfig get flavor;
  EnvironmentSpecificValues get environmentValues;
}

class EnvironmentImpl implements Environment {
  FlavorConfig? _flavor;
  late EnvironmentSpecificValues _environmentSpecificValues;

  EnvironmentImpl(FlavorConfig flavorConfig) {
    _flavor = flavorConfig;

    switch (flavorConfig.enviromentType) {
      case EnvironmentType.prod:
        _environmentSpecificValues = ProductionEnvironmentValues();
        break;
      case EnvironmentType.qa:
        _environmentSpecificValues = QAEnvironmentValues();
        break;
      default:
        _environmentSpecificValues = DevelopmentEnvironmentValues();
    }
  }

  @override
  FlavorConfig get flavor => _flavor!;

  @override
  EnvironmentSpecificValues get environmentValues => _environmentSpecificValues;
}
