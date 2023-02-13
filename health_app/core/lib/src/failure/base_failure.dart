import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

abstract class BaseFailure extends Equatable implements Failure {
  @override
  final String? failureData;

  const BaseFailure({this.failureData});

  @override
  List<Object?> get props => [failureData];
}
