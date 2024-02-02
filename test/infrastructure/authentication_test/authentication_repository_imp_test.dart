import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:veegil_bank_app/presentation/features/infrastructure/authentication/authentication_repository_imp.dart';


class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group("Authentication Repository tests", () {
    late http.Client httpClient;
    late MockResponse mockResponse;
    late AuthenticationRepositoryImp authenticationRepositoryImp;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      authenticationRepositoryImp =
          AuthenticationRepositoryImp(httpClient: httpClient);

    });

    const String baseVeegilUrl = "bankapi.veegil.com";
    const String authBaseUrl = "/auth";

    const String phoneNumber = "mock phone number +234";
    const String password = "mock password";
    const String comfirmPassword = "comfirmed mock password";

    final body = {
      "phoneNumber": phoneNumber,
      "password": password,
    };

    group("Authentication Repository Implementation Contructor Test", () {
      test("check if contructor doesn't require and argument", () {
        expect(AuthenticationRepositoryImp(), isNotNull);
      });
    });

    group("Test the sign in and sign up functions, and there return values",
        () {
      group("Sign up Test Block", () {
        test("Test for correct http response on call", () async {
          mockResponse = MockResponse();
          when(() => mockResponse.statusCode).thenReturn(200);
          when(() => mockResponse.body).thenReturn("{}");
          when(() => httpClient.post(any(), body: body))
              .thenAnswer((_) async => mockResponse);

          try {
            await authenticationRepositoryImp.signUpWithPhoneNumAndPassord(
                phoneNumber: phoneNumber,
                password: password,
                comfirmPassword: comfirmPassword);
          } catch (_) {}

          verify(
            () => httpClient.post(
              Uri.https(
                baseVeegilUrl,
                "$authBaseUrl/signup",
              ),
              body: body,
            ),
          ).called(1);
        });

        test("throws AuthenticationFailure on non-200 response", () async {
          mockResponse = MockResponse();
          when(() => mockResponse.statusCode).thenReturn(400);
          when(() => mockResponse.body).thenThrow(isA<AuthenticationFailure>());

          when(() => httpClient.post(any(), body: body))
              .thenAnswer((_) async => mockResponse);

          expect(
            () => authenticationRepositoryImp.signUpWithPhoneNumAndPassord(
                phoneNumber: phoneNumber,
                password: password,
                comfirmPassword: comfirmPassword),
            throwsA(isA<AuthenticationFailure>()),
          );
        });
      });

      group("Log in Test Block", () {
        test("Test for correct http response on call", () async {
          mockResponse = MockResponse();
          when(() => mockResponse.statusCode).thenReturn(200);
          when(() => mockResponse.body).thenReturn("{}");
          when(() => httpClient.post(any(), body: body))
              .thenAnswer((_) async => mockResponse);

          try {
            await authenticationRepositoryImp.logInUpWithPhoneNumAndPassord(
              phoneNumber: phoneNumber,
              password: password,
            );
          } catch (_) {}

          verify(
            () => httpClient.post(
              Uri.https(
                baseVeegilUrl,
                "$authBaseUrl/login",
              ),
              body: body,
            ),
          ).called(1);
        });

        test("throws AuthenticationFailure on non-200 response", () async {
          mockResponse = MockResponse();
          when(() => mockResponse.statusCode).thenReturn(400);
          when(() => mockResponse.body).thenThrow(isA<AuthenticationFailure>());

          when(() => httpClient.post(any(), body: body))
              .thenAnswer((_) async => mockResponse);

          expect(
            () => authenticationRepositoryImp.signUpWithPhoneNumAndPassord(
                phoneNumber: phoneNumber,
                password: password,
                comfirmPassword: comfirmPassword),
            throwsA(isA<AuthenticationFailure>()),
          );
        });
      });
    });
  });
}
