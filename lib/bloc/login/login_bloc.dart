import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginCliecked>(_loginClicked);
  }

  void _loginClicked(LoginCliecked event, Emitter<LoginState> emit) async {
    Map data = {"contact": event.email, "password": event.password};
    emit(state.copyWith(message: "Loading", loginStatus: LoginStatus.loading));
    try {
      final response = await http.post(
        Uri.parse("https://hindu-gpt.azurewebsites.net/api/v1/login/"),
        body: data,
      );

      if (response.statusCode == 201) {
        emit(state.copyWith(
            message: "Login Success", loginStatus: LoginStatus.success));
      } else {
        emit(state.copyWith(
            loginStatus: LoginStatus.error, message: "Something went wrong"));
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString()));
    }
  }
}
