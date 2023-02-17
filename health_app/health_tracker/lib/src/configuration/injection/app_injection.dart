// Package imports:
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:health_tracker/src/app.dart';
import 'package:health_tracker/src/configuration/environment/environment.dart';
import 'package:health_tracker/src/configuration/flavor_config.dart';
import 'package:health_tracker/src/configuration/injection/app_injection_cubits.dart';
import 'package:health_tracker/src/configuration/injection/app_injection_services.dart';
import 'package:health_tracker/src/configuration/injection/app_injection_usecases.dart';
import 'package:health_tracker/src/configuration/injection/app_injection_views.dart';
import 'package:health_tracker/src/presentation/pages/main_page.dart';
import 'package:logger/logger.dart';

//ignore_for_file: avoid-ignoring-return-values

class AppInjection {
  Injector? _injector;
  Injector? get injector => _injector;

  Future<void> initInjection(FlavorConfig flavorConfig) async {
    _injector = Injector();

    /// Application
    ///
    _injector!.map<App>(
      (Injector i) => App(
        mainPageFactory: i.get<MainPageFactory>(),
      ),
      isSingleton: true,
    );

    /// Environment
    ///
    _injector!.map<Environment>(
      (Injector i) => EnvironmentImpl(flavorConfig),
      isSingleton: true,
    );

    /// Log
    ///
    _injector!.map<Log>(
      (Injector i) => getLogger(logName: 'AppLog'),
      isSingleton: true,
    );

    /// Services
    ///
    await AppInjectionServices(injector!).initInjection(flavorConfig);

    /// Cubits
    ///
    await AppInjectionCubits(injector!).initInjection(flavorConfig);

    /// Views
    ///
    await AppInjectionViews(injector!).initInjection(flavorConfig);

    /// Use Cases
    ///
    await AppInjectionUseCases(injector!).initInjection(flavorConfig);
  }
}
