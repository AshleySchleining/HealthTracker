// Package imports:
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class CounterService {
  Future<Either<Failure, int>> incrementCount();

  Future<Either<Failure, int>> decrementCount();
}
