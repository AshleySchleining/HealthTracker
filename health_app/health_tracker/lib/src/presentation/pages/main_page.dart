// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/localizations.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:flutter_app_template/src/configuration/environment/environment.dart';
import 'package:flutter_app_template/src/presentation/blocs/counter_cubit.dart';
import 'package:flutter_app_template/src/presentation/blocs/counter_state.dart';

typedef MainPageFactory = MainPage Function();

class MainPage extends StatelessWidget {
  final CounterCubit counterCubit;

  const MainPage({
    Key? key,
    required this.counterCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final environment = Provider.of<Environment>(context, listen: false);

    final title =
        '${Strings.current.appTitle} (${environment.environmentValues.titleQualifier})';
    return BlocProvider<CounterCubit>(
      create: (context) => counterCubit,
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            if (state is CounterStateLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    ButtonRow(),
                  ],
                ),
              );
            } else if (state is CounterStateError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${state.failure}',
                      textAlign: TextAlign.center,
                    ),
                    const ButtonRow(),
                  ],
                ),
              );
            } else {
              final loadedState = state as CounterStateLoaded;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${loadedState.count}',
                      textAlign: TextAlign.center,
                    ),
                    const ButtonRow(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          key: const ValueKey('INCREMENT_BUTTON'),
          icon: const Icon(Icons.arrow_upward),
          onPressed: () => onIncrement(context),
        ),
        IconButton(
          key: const ValueKey('DECREMENT_BUTTON'),
          icon: const Icon(Icons.arrow_downward),
          onPressed: () => onDecrement(context),
        )
      ],
    );
  }

  void onIncrement(BuildContext context) async {
    final cubit = BlocProvider.of<CounterCubit>(context, listen: false);
    await cubit.increment();
  }

  void onDecrement(BuildContext context) async {
    final cubit = BlocProvider.of<CounterCubit>(context, listen: false);
    await cubit.decrement();
  }
}
