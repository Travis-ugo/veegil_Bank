// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart';
import 'package:veegil_bank_app/presentation/features/domain/transaction_domain/transaction_repository.dart';
import 'package:http/http.dart' as http;
import 'package:veegil_bank_app/presentation/features/domain/transaction_domain/transaction_transfer_model.dart';
import 'package:veegil_bank_app/presentation/features/domain/transaction_domain/transaction_withdraw_models.dart';

class TransferMoneyFromAccountFailure implements Exception {}

class WithDrawMoneyFromAccountFailure implements Exception {}

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

    final transferMoneyFromAccountRequest = Uri.https(
      baseVeegilUrl,
      transactionBaseUrl + transferUrl,
    );

    final body = {
      "phoneNumber": phoneNumber,
      "amount": "$amount",
    };

    final transferMoneyFromAccountResponse =
        await _httpClient.post(transferMoneyFromAccountRequest, body: body);

    if (transferMoneyFromAccountResponse.statusCode != 200) {
      throw TransferMoneyFromAccountFailure();
    }

    return transactionsTransferModelFromJson(
        transferMoneyFromAccountResponse.body);
  }

  @override
  Future<TransactionsWithDrawModel> withDrawMoneyFromAccount({
    required String phoneNumber,
    required int amount,
  }) async {
    const String withDrawUrl = "/withdraw";
    
    // final withDrawMoneyFromAccountRequest = Uri.https(
    //   baseVeegilUrl,
    //   transactionBaseUrl + withDrawUrl,
    // );

    // final body = {
    //   "phoneNumber": phoneNumber,
    //   "amount": "$amount",
    // };

    final withDrawMoneyFromAccounResponse = await helperFunction(
      phoneNumber,
      amount,
      withDrawUrl,
    );
    // await _httpClient.post(withDrawMoneyFromAccountRequest, body: body);

    if (withDrawMoneyFromAccounResponse.statusCode != 200) {
      throw WithDrawMoneyFromAccountFailure();
    }

    return transactionsWithDrawModelFromJson(
        withDrawMoneyFromAccounResponse.body);
  }

  Future<Response> helperFunction(
      String phoneNumber, int amount, String urlPrefix) async {
    String newUrl = urlPrefix;
    final helperRequest = Uri.https(
      baseVeegilUrl,
      transactionBaseUrl + newUrl,
    );

    final body = {
      "phoneNumber": phoneNumber,
      "amount": "$amount",
    };

    final helperResponse = await _httpClient.post(helperRequest, body: body);

    return helperResponse;
  }
}
