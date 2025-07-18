part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  final bool error;
  CounterState({this.counter = 0, this.error = false});

  @override
  List<Object> get props => [counter, error];

  CounterState copyWith({int? counter, bool? error}) {
    return CounterState(
        counter: counter ?? this.counter, error: error ?? this.error);
  }
}
