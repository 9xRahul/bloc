import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotificationEvent>(_changeSwitchValue);
    on<SliderEvent>(_changeSlider);
  }

  void _changeSwitchValue(
      EnableOrDisableNotificationEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(switchValue: !state.switchValue));
  }

  void _changeSlider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
