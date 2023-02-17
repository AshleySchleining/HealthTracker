// Package imports:
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:health_tracker/src/configuration/flavor_config.dart';
import 'package:health_tracker/src/presentation/blocs/counter_cubit.dart';
import 'package:health_tracker/src/presentation/pages/main_page.dart';

//ignore_for_file: avoid-ignoring-return-values

class AppInjectionViews {
  final Injector injector;

  AppInjectionViews(this.injector);

  Future<void> initInjection(FlavorConfig flavorConfig) async {
    /// MainPageFactory
    ///
    injector.map<MainPageFactory>(
      (Injector i) => () => i.get<MainPage>(),
      isSingleton: true,
    );

    /// MainPage
    ///
    injector.map<MainPage>(
      (Injector i) => MainPage(
        counterCubit: i.get<CounterCubit>(),
      ),
      isSingleton: true,
    );
  }
}
