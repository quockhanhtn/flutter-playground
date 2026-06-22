import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0)) {
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterState(counterValue: state.counterValue + 1));
    });
    on<CounterDecrementEvent>((event, emit) {
      emit(CounterState(counterValue: state.counterValue - 1));
    });
  }
}
