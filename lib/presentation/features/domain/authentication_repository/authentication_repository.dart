import 'package:veegil_bank_app/presentation/features/domain/authentication_repository/authenticatin_model.dart';

abstract class AuthenticationRepository {
  Future<AuthenticationSignUpModel> signUpWithPhoneNumAndPassord(
      {required String phoneNumber, required String password,required String comfirmPassword});
  Future<AuthenticationLogInModel> logInUpWithPhoneNumAndPassord(
      {required String phoneNumber, required String password});
  Future<void> logOut();
}

