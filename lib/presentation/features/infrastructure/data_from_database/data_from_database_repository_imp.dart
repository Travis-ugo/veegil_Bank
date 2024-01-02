import 'package:veegil_bank_app/presentation/features/domain/data_from_database/accounts_list_models.dart';
import 'package:veegil_bank_app/presentation/features/domain/data_from_database/auth_users_model.dart';
import 'package:veegil_bank_app/presentation/features/domain/data_from_database/data_from_database_repository.dart';
import 'package:http/http.dart' as http;
import 'package:veegil_bank_app/presentation/features/domain/data_from_database/transaction_models.dart';

class AuthUsersRequestFailure implements Exception {}

class AccountsListRequestFailure implements Exception {}

class TransactionsRequestFailure implements Exception {}

class DataFromDataBaseModelImp implements DataFromDataBaseModel {
  DataFromDataBaseModelImp({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const String baseVeegilUrl = "bankapi.veegil.com";

  @override
  Future<AuthUsersModel> getListOfAuthenticatedUsers() async {
    const String authenticatedUsersUrl = "/auth/users";

    final authUsersListRequest = Uri.https(
      baseVeegilUrl,
      authenticatedUsersUrl,
    );

    final authUsersListResponse = await _httpClient.get(authUsersListRequest);
    if (authUsersListResponse.statusCode != 200) {
      throw AuthUsersRequestFailure();
    }

    return authUsersModelFromJson(authUsersListResponse.body);
  }

  @override
  Future<AccountsListModel> getListOfAccounts() async {
    const String accountsListUrl = "/auth/users";

    final accountsListRequest = Uri.https(
      baseVeegilUrl,
      accountsListUrl,
    );

    final accountsListResponse = await _httpClient.get(accountsListRequest);

    if (accountsListResponse.statusCode != 200) {
      throw AccountsListRequestFailure();
    }

    return accountsListModelFromJson(accountsListResponse.body);
  }

  @override
  Future<TransactionsModel> getListOfUserTransactions() async {
    const String transactionsUrl = "/transactions";

    final authenticationRequest = Uri.https(
      baseVeegilUrl,
      transactionsUrl,
    );

    final transactionsResponse = await _httpClient.get(authenticationRequest);

    if (transactionsResponse.statusCode != 200) {
      throw TransactionsRequestFailure();
    }
    return transactionsModelFromJson(transactionsResponse.body);
  }
}
