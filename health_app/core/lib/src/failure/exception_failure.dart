// Project imports:
import 'package:core/src/failure/base_failure.dart';

class ExceptionFailure extends BaseFailure {
  final Exception exception;
  final StackTrace? stackTrace;

  ExceptionFailure({
    required this.exception,
    this.stackTrace,
  }) : super(failureData: exception.toString());
}
