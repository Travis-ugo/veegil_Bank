import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:veegil_bank_app/features/domain/authentication_repository/authenticatin_model.dart';
import 'package:veegil_bank_app/features/infrastructure/authentication/authentication_repository_imp..dart';

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
    on<SubmitAuthFormButtonSignupEvent>(_submitAuthFormButtonSignupEvent);
    on<SubmitAuthFormButtonLoginEvent>(_submitAuthFormButtonLoginEvent);
  }

  void _phoneNumberChangedEvent(
      PhoneNumberChangedEvent event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(
      phoneNubmber: event.phoneNumber,
    ));
    print("current state of the phone number section: ${state.phoneNubmber}");
  }

  void _passwordChangedEvent(
      PasswordChangedEvent event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(
      password: event.password,
    ));
    print("current state of the password section: ${state.password}");
  }

  void _comfirmPasswordChangedEvent(
      ComfirmPasswordChangedEvent event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(
      comfirmPassword: event.comfirmpassword,
    ));
  }

  Future<AuthenticationSignUpModel> _submitAuthFormButtonSignupEvent(
      SubmitAuthFormButtonSignupEvent event,
      Emitter<AuthenticationState> emit) async {
    print(
        "current phone number: ${state.phoneNubmber}, current password: ${state.password}, current confirmPassword: ${state.comfirmPassword}");
    try {
      var authenticationSignUpModel =
          await _authenticationRepositoryImp.signUpWithPhoneNumAndPassord(
        phoneNumber: state.phoneNubmber,
        password: state.password,
        comfirmPassword: state.comfirmPassword,
      );
      print("printer ::::::: ${authenticationSignUpModel.message}");

      emit(state.copyWith(
        authStatus: authenticationSignUpModel.status,
        authMessage: authenticationSignUpModel.message,
      ));

      return authenticationSignUpModel;
    } catch (error) {
      print("error catch $error");
      //   emit(state.copyWith(
      //   authStatus: authenticationSignUpModel.status,
      //   authMessage: authenticationSignUpModel.message,
      // ));
    }
    return AuthenticationSignUpModel(
      data: AuthSignInData(phoneNumber: '', created: DateTime.now()),
      status: '',
      message: '',
    );
  }

  Future _submitAuthFormButtonLoginEvent(
    SubmitAuthFormButtonLoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    print(
        "current phone number: ${state.phoneNubmber}, current password: ${state.password}, current confirmPassword: ${state.comfirmPassword}");
    try {
      var authenticationSignUpModel =
          await _authenticationRepositoryImp.logInUpWithPhoneNumAndPassord(
        phoneNumber: state.phoneNubmber,
        password: state.password,
      );
      print("printer ::::::: ${authenticationSignUpModel.message}");

      emit(state.copyWith(
        authStatus: "success",//authenticationSignUpModel.status,
        authMessage: authenticationSignUpModel.message,
      ));

      return authenticationSignUpModel;
    } catch (error) {
      print("error catch $error");
      //   emit(state.copyWith(
      //   authStatus: authenticationSignUpModel.status,
      //   authMessage: authenticationSignUpModel.message,
      // ));
    }
  }
}
