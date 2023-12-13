// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:veegil_bank_app/features/domain/transaction_domain/transaction_repository.dart';
import 'package:http/http.dart' as http;
import 'package:veegil_bank_app/features/domain/transaction_domain/transaction_transfer_model.dart';
import 'package:veegil_bank_app/features/domain/transaction_domain/transaction_withdraw_models.dart';

class TransactionRepositoryImp implements TransactionRepository {
  TransactionRepositoryImp({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const String baseVeegilUrl = "bankapi.veegil.com";
  static const String transactionBaseUrl = "/accounts";

  @override
  Future<TransactionsTransferModel> transferMoneyFromAccount({
    required String phoneNumber,
    required int amount,
  }) async {
    const String transferUrl = "/transfer";

    final authenticationRequest = Uri.https(
      baseVeegilUrl,
      transactionBaseUrl + transferUrl,
    );

    final body = {
      "phoneNumber": phoneNumber,
      "amount": "$amount",
    };

    try {
      final authenticationResponse =
          await _httpClient.post(authenticationRequest, body: body);

      return transactionsTransferModelFromJson(authenticationResponse.body);
    } catch (error) {
      print("Error Catch $error");

      return const TransactionsTransferModel(
        status: 'error',
        message: 'token in love',
        data: TransactionsTransferModelData(sent: 200),
      );
    }
  }

  @override
  Future<TransactionsWithDrawModel> withDrawMoneyFromAccount({
    required String phoneNumber,
    required int amount,
  }) async {
    const String withDrawUrl = "/withdraw";
    final authenticationRequest = Uri.https(
      baseVeegilUrl,
      transactionBaseUrl + withDrawUrl,
    );

    final body = {
      "phoneNumber": phoneNumber,
      "amount": "$amount",
    };

    try {
      final authenticationResponse =
          await _httpClient.post(authenticationRequest, body: body);


      return transactionsWithDrawModelFromJson(authenticationResponse.body);
    } catch (error) {
      print("Error Catch $error");
      // TODO: implement transferMoneyFromAccount
      throw UnimplementedError();
    }
  }
}
