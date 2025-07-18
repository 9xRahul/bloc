part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool switchValue;
  final double slider;
  const SwitchState({this.switchValue = false, this.slider = 1.0});

  @override
  List<Object> get props => [switchValue, slider];

  SwitchState copyWith({bool? switchValue, double? slider}) {
    return SwitchState(
        switchValue: switchValue ?? this.switchValue,
        slider: slider ?? this.slider);
  }
}
