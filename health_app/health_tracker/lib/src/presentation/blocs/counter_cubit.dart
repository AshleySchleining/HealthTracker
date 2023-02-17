import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tracker/src/domain/usecases/decrement_count_use_case.dart';
import 'package:health_tracker/src/domain/usecases/increment_count_use_case.dart';
import 'package:health_tracker/src/presentation/blocs/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final IncrementCountUseCase incrementCount;
  final DecrementCountUseCase decrementCount;

  CounterCubit({
    required this.incrementCount,
    required this.decrementCount,
  }) : super(CounterStateLoaded(count: 0));

  Future<void> increment() async {
    emit(CounterStateLoading());

    final results = await incrementCount();

    results.fold((failure) => emit(CounterStateError(failure: failure)),
        (data) => emit(CounterStateLoaded(count: data)));
  }

  Future<void> decrement() async {
    emit(CounterStateLoading());

    final results = await decrementCount();

    results.fold((failure) => emit(CounterStateError(failure: failure)),
        (data) => emit(CounterStateLoaded(count: data)));
  }
}
