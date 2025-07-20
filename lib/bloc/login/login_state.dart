part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;
  const LoginState(
      {this.email = "",
      this.password = "",
      this.message = "",
      this.loginStatus = LoginStatus.initial});

  LoginState copyWith(
      {String? email,
      String? password,
      String? message,
      LoginStatus? loginStatus}) {
    return LoginState(
        email: email ?? this.email,
        loginStatus: loginStatus ?? this.loginStatus,
        message: message ?? this.message,
        password: password ?? this.password);
  }

  @override
  List<Object> get props => [email, message, password, loginStatus];
}
