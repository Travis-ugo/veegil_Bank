// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.phoneNubmber = "",
    this.password = "",
    this.comfirmPassword = "",
    this.authStatus = "",
    this.authMessage = "",
  });

  final String phoneNubmber;
  final String password;
  final String comfirmPassword;
  final String authStatus;
  final String authMessage;

  @override
  List<Object> get props => [
        phoneNubmber,
        password,
        comfirmPassword,
        authMessage,
        authStatus,
      ];

  AuthenticationState copyWith({
    String? phoneNubmber,
    String? password,
    String? comfirmPassword,
    String? authStatus,
    String? authMessage,
  }) {
    return AuthenticationState(
      phoneNubmber: phoneNubmber ?? this.phoneNubmber,
      password: password ?? this.password,
      comfirmPassword: comfirmPassword ?? this.comfirmPassword,
      authStatus: authStatus ?? this.authStatus,
      authMessage: authMessage ?? this.authMessage,
    );
  }
}
enum WeatherStatus { initial, loading, success, failure }