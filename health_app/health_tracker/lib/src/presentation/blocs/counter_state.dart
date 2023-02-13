

abstract class CounterState extends Equatable {}

class CounterStateLoading extends CounterState {
  @override
  List<Object?> get props => [];
}

class CounterStateLoaded extends CounterState {
  final int count;

  CounterStateLoaded({required this.count});

  @override
  List<Object?> get props => [count];
}

class CounterStateError extends CounterState {
  final Failure failure;

  CounterStateError({required this.failure});

  @override
  List<Object?> get props => [failure];
}
