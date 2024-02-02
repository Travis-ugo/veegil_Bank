import 'package:http/http.dart' as http;
import 'package:veegil_bank_app/presentation/features/domain/authentication_repository/authentication_model.dart';

import 'package:veegil_bank_app/presentation/features/domain/authentication_repository/authentication_repository.dart';

class AuthenticationFailure implements Exception {}

class AuthenticationRepositoryImp implements AuthenticationRepository {
  AuthenticationRepositoryImp({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  static const String baseVeegilUrl = "bankapi.veegil.com";
  static const String authBaseUrl = "/auth";

  static const String signUpUrl = "/signup";

  @override
  Future<AuthenticationSignUpModel> signUpWithPhoneNumAndPassord({
    required String phoneNumber,
    required String password,
    required String comfirmPassword,
  }) async {
    final body = {
      "phoneNumber": phoneNumber,
      "password": password,
    };

    final authenticationRequest = Uri.https(
      baseVeegilUrl,
      authBaseUrl + signUpUrl,
    );

    final authenticationResponse =
        await _httpClient.post(authenticationRequest, body: body);

    if (authenticationResponse.statusCode != 200) throw AuthenticationFailure();

    return authenticationSignUpModelFromJson(authenticationResponse.body);
  }

  @override
  Future<AuthenticationLogInModel> logInUpWithPhoneNumAndPassord({
    required String phoneNumber,
    required String password,
  }) async {
    const String logInUrl = "/login";

    final body = {
      "phoneNumber": phoneNumber,
      "password": password,
    };

    final authenticationRequest = Uri.https(
      baseVeegilUrl,
      authBaseUrl + logInUrl,
    );

    final authenticationResponse =
        await _httpClient.post(authenticationRequest, body: body);

    if (authenticationResponse.statusCode != 200) throw AuthenticationFailure();

    print("respnonse from auth plug ${authenticationResponse.body}");

    return authenticationLogInModelFromJson(authenticationResponse.body);
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
