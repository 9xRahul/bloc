import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }

  void _increment(IncrementEvent event, Emitter<CounterState> emit) {
    if (state.counter > 9) {
      emit(state.copyWith(counter: state.counter, error: true));
    } else {
      emit(state.copyWith(counter: state.counter + 1, error: false));
    }
  }

  void _decrement(DecrementEvent event, Emitter<CounterState> emit) {
    if (state.counter == 0) {
      emit(state.copyWith(counter: 0, error: true));
    } else {
      emit(state.copyWith(counter: state.counter - 1, error: false));
    }
  }
}
