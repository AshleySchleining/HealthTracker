// Package imports:
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import 'package:health_tracker/src/domain/services/counter_service.dart';

class DecrementCountUseCase {
  final CounterService counterService;

  const DecrementCountUseCase({
    required this.counterService,
  });

  Future<Either<Failure, int>> call() async {
    return counterService.decrementCount();
  }
}
