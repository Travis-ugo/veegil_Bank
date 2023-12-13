// ignore: file_names
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:veegil_bank_app/features/domain/authentication_repository/authenticatin_model.dart';

import 'package:veegil_bank_app/features/domain/authentication_repository/authentication_repository.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  AuthenticationRepositoryImp({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const String baseVeegilUrl = "bankapi.veegil.com";
  static const String authBaseUrl = "/auth";

  @override
  Future<AuthenticationSignUpModel> signUpWithPhoneNumAndPassord(
      {required String phoneNumber,
      required String password,
      required String comfirmPassword}) async {
    const String signUpUrl = "/signup";
    final Response authenticationResponse;

    final authenticationRequest = Uri.https(
      baseVeegilUrl,
      authBaseUrl + signUpUrl,
    );

    final body = {
      "phoneNumber": phoneNumber,
      "password": password,
    };

    try {
      authenticationResponse =
          await _httpClient.post(authenticationRequest, body: body);

      print("respnonse from auth plug ${authenticationResponse.body}");

      return authenticationSignUpModelFromJson(authenticationResponse.body);
    } catch (error) {
      print("Error Catch ${error}");
      
    }

    return AuthenticationSignUpModel(
      data: AuthSignInData(phoneNumber: '', created: DateTime.now()),
      status: '',
      message: 'messageeeeeee',
    );
  }

  @override
  Future<AuthenticationLogInModel> logInUpWithPhoneNumAndPassord(
      {required String phoneNumber, required String password}) async {
    const String logInUrl = "/login";

    final authenticationRequest = Uri.https(
      baseVeegilUrl,
      authBaseUrl + logInUrl,
    );

    final body = {
      "phoneNumber": phoneNumber,
      "password": password,
    };

    try {
      final authenticationResponse =
          await _httpClient.post(authenticationRequest, body: body);

      print("respnonse from auth plug ${authenticationResponse.body}");

      return authenticationLogInModelFromJson(authenticationResponse.body);
    } catch (error) {
      print("Error Catch $error");
    }

    return const AuthenticationLogInModel(
        status: '', message: '', data: AuthLogInData(token: 'token'));
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
