import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:veegil_bank_app/presentation/features/domain/authentication_repository/auth_failures.dart';
import 'package:veegil_bank_app/presentation/features/infrastructure/authentication/authentication_repository_imp.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepositoryImp _authenticationRepositoryImp;

  AuthenticationBloc({
    required authenticationRepositoryImp,
  })  : _authenticationRepositoryImp = authenticationRepositoryImp,
        super(const AuthenticationState()) {
    on<PhoneNumberChangedEvent>(_phoneNumberChangedEvent);
    on<PasswordChangedEvent>(_passwordChangedEvent);
    on<ComfirmPasswordChangedEvent>(_comfirmPasswordChangedEvent);
    on<SubmitAuthFormButtonSignupEvent>(_submitAuthFormSignupEvent);
    on<SubmitAuthFormButtonLoginEvent>(_submitAuthFormLoginEvent);
  }

  void _phoneNumberChangedEvent(
      PhoneNumberChangedEvent event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(
      phoneNubmber: event.phoneNumber,
    ));
  }

  void _passwordChangedEvent(
      PasswordChangedEvent event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(
      password: event.password,
    ));
  }

  void _comfirmPasswordChangedEvent(
      ComfirmPasswordChangedEvent event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(
      comfirmPassword: event.comfirmpassword,
    ));
  }

  Future _submitAuthFormSignupEvent(SubmitAuthFormButtonSignupEvent event,
      Emitter<AuthenticationState> emit) async {
    try {
      final authenticationSignUpModel =
          await _authenticationRepositoryImp.signUpWithPhoneNumAndPassord(
        phoneNumber: state.phoneNubmber,
        password: state.password,
        comfirmPassword: state.comfirmPassword,
      );

      emit(state.copyWith(
        authStatus: authenticationSignUpModel.status,
        authMessage: authenticationSignUpModel.message,
      ));

      return authenticationSignUpModel;
    } on SignUpWithEmailAndPasswordFailure catch (error) {
      emit(state.copyWith(
        authStatus: "failure",
        authMessage: error.message,
      ));
    } catch (error) {
      emit(state.copyWith(
        authStatus: "failure",
      ));
    }
  }

  Future _submitAuthFormLoginEvent(
    SubmitAuthFormButtonLoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final authenticationSignUpModel =
          await _authenticationRepositoryImp.logInUpWithPhoneNumAndPassord(
        phoneNumber: state.phoneNubmber,
        password: state.password,
      );

      emit(state.copyWith(
        authStatus: authenticationSignUpModel.status,
        authMessage: authenticationSignUpModel.message,
      ));

      return authenticationSignUpModel;
    } on LoginWithEmailAndPasswordFailure catch (e) {
      emit(state.copyWith(
        authStatus: "failure",
        authMessage: e.message,
      ));
    } catch (error) {
      emit(state.copyWith(
        authStatus: "failure",
      ));
    }
  }
}
