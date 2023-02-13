import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:health_tracker/src/data/data_sources/count_data_source.dart';
import 'package:health_tracker/src/domain/services/counter_service.dart';

class CounterServiceImpl implements CounterService {
  final CountDataSource dataSource;

  CounterServiceImpl({required this.dataSource});

  @override
  Future<Either<Failure, int>> decrementCount() async {
    try {
      final currentValue = await dataSource.retrieveCurrentCount();
      final modifiedCount = currentValue - 1;
      await dataSource.updateCurrentCount(newCount: modifiedCount);
      return Right(modifiedCount);
    } on Exception catch (e, stackTrace) {
      return Left(ExceptionFailure(exception: e, stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, int>> incrementCount() async {
    try {
      final currentValue = await dataSource.retrieveCurrentCount();
      final modifiedCount = currentValue + 1;
      await dataSource.updateCurrentCount(newCount: modifiedCount);
      return Right(modifiedCount);
    } on Exception catch (e, stackTrace) {
      return Left(ExceptionFailure(exception: e, stackTrace: stackTrace));
    }
  }
}
