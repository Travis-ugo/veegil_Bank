import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:veegil_bank_app/presentation/features/infrastructure/transactions/transaction_repository_imp.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group("Authentication Repository tests", () {
    late http.Client httpClient;
    late MockResponse mockResponse;
    late TransactionRepositoryImp transactionRepositoryImp;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      transactionRepositoryImp =
          TransactionRepositoryImp(httpClient: httpClient);
    });

    const String baseVeegilUrl = "bankapi.veegil.com";

    const String withDrawUrl = "/withdraw";

    const String phoneNumber = "mock phone number +234";
    const String password = "mock password";

    const String transactionBaseUrl = "/accounts";
    const String transferUrl = "/transfer";

    final body = {
      "phoneNumber": "mock phone number +234",
      "amount": "200",
    };

    group("Authentication Repository Implementation Contructor Test", () {
      test("check if contructor doesn't require and argument", () {
        expect(TransactionRepositoryImp(), isNotNull);
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
            await transactionRepositoryImp.transferMoneyFromAccount(
              phoneNumber: phoneNumber,
              amount: password,
            );
          } catch (_) {}

          verify(
            () => httpClient.post(
              Uri.https(
                baseVeegilUrl,
                transactionBaseUrl + transferUrl,
              ),
              body: body,
            ),
          ).called(1);
        });

        // test("throws AuthenticationFailure on non-200 response", () async {
        //   mockResponse = MockResponse();
        //   when(() => mockResponse.statusCode).thenReturn(400);
        //   when(() => mockResponse.body)
        //       .thenThrow(isA<TransferMoneyFromAccountFailure>());

        //   when(() => httpClient.post(any(), body: body))
        //       .thenAnswer((_) async => mockResponse);

        //   expect(
        //     () async => transactionRepositoryImp.transferMoneyFromAccount(
        //       phoneNumber: phoneNumber,
        //       amount: password,
        //     ),
        //     throwsA(isA<TransferMoneyFromAccountFailure>()),
        //   );
        // });
      });

      group("Log in Test Block", () {
        test("Test for correct http response on call", () async {
          mockResponse = MockResponse();
          when(() => mockResponse.statusCode).thenReturn(200);
          when(() => mockResponse.body).thenReturn("{}");
          when(() => httpClient.post(any(), body: body))
              .thenAnswer((_) async => mockResponse);

          try {
            await transactionRepositoryImp.withDrawMoneyFromAccount(
              phoneNumber: phoneNumber,
              amount: password,
            );
          } catch (_) {}

          verify(
            () => httpClient.post(
              Uri.https(
                baseVeegilUrl,
                transactionBaseUrl +  withDrawUrl,
              ),
              body: body,
            ),
          ).called(0);
        });

        test("throws AuthenticationFailure on non-200 response", () async {
          mockResponse = MockResponse();
          when(() => mockResponse.statusCode).thenReturn(400);
          when(() => mockResponse.body)
              .thenThrow(isA<WithDrawMoneyFromAccountFailure>());

          when(() => httpClient.post(any(), body: body))
              .thenAnswer((_) async => mockResponse);

          expect(
            () => transactionRepositoryImp.withDrawMoneyFromAccount(
              phoneNumber: phoneNumber,
              amount: password,
            ),
            throwsA(isA<WithDrawMoneyFromAccountFailure>()),
          );
        });
      });
    });
  });
}
