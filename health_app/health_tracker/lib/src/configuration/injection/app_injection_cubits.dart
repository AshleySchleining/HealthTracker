// Package imports:
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:health_tracker/src/configuration/flavor_config.dart';
import 'package:health_tracker/src/domain/usecases/decrement_count_use_case.dart';
import 'package:health_tracker/src/domain/usecases/increment_count_use_case.dart';
import 'package:health_tracker/src/presentation/blocs/counter_cubit.dart';

//ignore_for_file: avoid-ignoring-return-values

class AppInjectionCubits {
  final Injector injector;

  AppInjectionCubits(this.injector);

  Future<void> initInjection(FlavorConfig flavorConfig) async {
    /// Counter Cubit
    ///
    injector.map<CounterCubit>(
      (Injector i) => CounterCubit(
        incrementCount: i.get<IncrementCountUseCase>(),
        decrementCount: i.get<DecrementCountUseCase>(),
      ),
      isSingleton: true,
    );
  }
}
