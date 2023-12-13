import 'package:veegil_bank_app/features/domain/data_from_database/accounts_list_models.dart';
import 'package:veegil_bank_app/features/domain/data_from_database/auth_users_model.dart';
import 'package:veegil_bank_app/features/domain/data_from_database/data_from_database_repository.dart';
import 'package:http/http.dart' as http;
import 'package:veegil_bank_app/features/domain/data_from_database/transaction_models.dart';

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

    try {
      final authUsersListResponse = await _httpClient.get(authUsersListRequest);

      return authUsersModelFromJson(authUsersListResponse.body);
    } catch (error) {
      print("Error Catch $error");
    }
    return AuthUsersModel(message: '', status: '', data: []);
  }

  @override
  Future<AccountsListModel> getListOfAccounts() async {
    const String accountsListUrl = "/auth/users";

    final accountsListRequest = Uri.https(
      baseVeegilUrl,
      accountsListUrl,
    );

    try {
      final accountsListResponse = await _httpClient.get(accountsListRequest);

      return accountsListModelFromJson(accountsListResponse.body);
    } catch (error) {
      print("Error Catch $error");
    }
    return const AccountsListModel(message: '', status: '', data: []);
  }

  @override
  Future<TransactionsModel> getListOfUserTransactions() async {
    const String transactionsUrl = "/transactions";

    final authenticationRequest = Uri.https(
      baseVeegilUrl,
      transactionsUrl,
    );
    try {
      final transactionsResponse = await _httpClient.get(authenticationRequest);

      return transactionsModelFromJson(transactionsResponse.body);
    } catch (error) {
      print("Error Catch $error");
    }

    return TransactionsModel(data: [], status: '');
  }
}

