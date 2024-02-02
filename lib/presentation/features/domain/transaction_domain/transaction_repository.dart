import 'package:veegil_bank_app/presentation/features/domain/transaction_domain/transaction_transfer_model.dart';
import 'package:veegil_bank_app/presentation/features/domain/transaction_domain/transaction_withdraw_models.dart';

abstract class TransactionRepository {
  Future<TransactionsWithDrawModel> withDrawMoneyFromAccount(
      {required String phoneNumber, required String amount});
  Future<TransactionsTransferModel> transferMoneyFromAccount(
      {required String phoneNumber, required String amount});
}