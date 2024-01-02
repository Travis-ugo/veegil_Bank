import 'package:veegil_bank_app/presentation/features/domain/data_from_database/accounts_list_models.dart';
import 'package:veegil_bank_app/presentation/features/domain/data_from_database/auth_users_model.dart';
import 'package:veegil_bank_app/presentation/features/domain/data_from_database/transaction_models.dart';

abstract class DataFromDataBaseModel {
  Future<AccountsListModel> getListOfAccounts();
  Future<TransactionsModel> getListOfUserTransactions();
  Future<AuthUsersModel> getListOfAuthenticatedUsers();
}
