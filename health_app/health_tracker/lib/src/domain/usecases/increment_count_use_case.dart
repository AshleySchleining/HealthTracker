// Package imports:
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import 'package:health_tracker/src/domain/services/counter_service.dart';

class IncrementCountUseCase {
  final CounterService counterService;

  const IncrementCountUseCase({
    required this.counterService,
  });

  Future<Either<Failure, int>> call() async {
    return counterService.incrementCount();
  }
}
