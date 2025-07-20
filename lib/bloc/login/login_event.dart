part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}


class LoginCliecked extends LoginEvent {
  final String email;
  final String password;

  LoginCliecked({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}
