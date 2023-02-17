// Package imports:
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:health_tracker/src/configuration/flavor_config.dart';
import 'package:health_tracker/src/domain/services/counter_service.dart';
import 'package:health_tracker/src/domain/usecases/decrement_count_use_case.dart';
import 'package:health_tracker/src/domain/usecases/increment_count_use_case.dart';

//ignore_for_file: avoid-ignoring-return-values

class AppInjectionUseCases {
  final Injector injector;

  AppInjectionUseCases(this.injector);

  Future<void> initInjection(FlavorConfig flavorConfig) async {
    /// Increment Count Use Case
    ///
    injector.map<IncrementCountUseCase>(
      (Injector i) => IncrementCountUseCase(
        counterService: i.get<CounterService>(),
      ),
      isSingleton: true,
    );

    /// Decrement Count Use Case
    ///
    injector.map<DecrementCountUseCase>(
      (Injector i) => DecrementCountUseCase(
        counterService: i.get<CounterService>(),
      ),
      isSingleton: true,
    );
  }
}
