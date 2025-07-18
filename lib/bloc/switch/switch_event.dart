part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EnableOrDisableNotificationEvent extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  double slider;
  SliderEvent({required this.slider});
  @override
  List<Object> get props => [slider];
}
