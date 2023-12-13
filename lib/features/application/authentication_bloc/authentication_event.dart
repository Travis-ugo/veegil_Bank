part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class PhoneNumberChangedEvent extends AuthenticationEvent {
  final String phoneNumber;

  const PhoneNumberChangedEvent(this.phoneNumber);
}

class PasswordChangedEvent extends AuthenticationEvent {
  final String password;

  const PasswordChangedEvent(this.password);
}

class ComfirmPasswordChangedEvent extends AuthenticationEvent {
  final String comfirmpassword;

  const ComfirmPasswordChangedEvent(this.comfirmpassword);
}

class SubmitAuthFormButtonSignupEvent extends AuthenticationEvent {}

class SubmitAuthFormButtonLoginEvent extends AuthenticationEvent {}
