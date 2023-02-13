// Dart imports:
import 'dart:io';

// Project imports:
import 'package:core/src/failure/base_failure.dart';

class HttpStatusFailure extends BaseFailure {
  final int? statusCode;

  HttpStatusFailure({this.statusCode = HttpStatus.ok})
      : super(failureData: statusCode.toString());
}
