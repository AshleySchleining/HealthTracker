// Project imports:
import 'package:core/src/failure/base_failure.dart';

enum NetworkFailureType {
  networkUnavailable,
}

class NetworkFailure extends BaseFailure {
  final NetworkFailureType? failure;

  const NetworkFailure({this.failure});

  factory NetworkFailure.networkUnavailable() {
    return const NetworkFailure(failure: NetworkFailureType.networkUnavailable);
  }
}
