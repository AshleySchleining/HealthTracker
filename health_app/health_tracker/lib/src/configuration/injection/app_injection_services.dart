// Package imports:
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:health_tracker/src/configuration/flavor_config.dart';
import 'package:health_tracker/src/data/data_sources/count_data_source.dart';
import 'package:health_tracker/src/data/services/counter_service_impl.dart';
import 'package:health_tracker/src/domain/services/counter_service.dart';

//ignore_for_file: avoid-ignoring-return-values

class AppInjectionServices {
  final Injector injector;

  AppInjectionServices(this.injector);

  Future<void> initInjection(FlavorConfig flavorConfig) async {
    /// Counter Service
    ///
    injector.map<CounterService>(
      (Injector i) => CounterServiceImpl(
        dataSource: i.get<CountDataSource>(),
      ),
      isSingleton: true,
    );

    /// Count Data Source
    ///
    injector.map<CountDataSource>((Injector i) => CountDataSource(),
        isSingleton: true);
  }
}
