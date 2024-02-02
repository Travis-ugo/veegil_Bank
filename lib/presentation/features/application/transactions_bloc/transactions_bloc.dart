import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:veegil_bank_app/presentation/features/domain/transaction_domain/transaction_transfer_model.dart';
import 'package:veegil_bank_app/presentation/features/domain/transaction_domain/transaction_withdraw_models.dart';
import 'package:veegil_bank_app/presentation/features/infrastructure/transactions/transaction_repository_imp.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionRepositoryImp _transactionRepositoryImp;

  TransactionsBloc({
    required TransactionRepositoryImp transactionRepositoryImp,
  })  : _transactionRepositoryImp = transactionRepositoryImp,
        super(const TransactionsState()) {
    on<TransferMoneyToOtherAccountEvent>(_onTransferMoneyToOtherAccountEvent);
    on<WithdrawMoneyFromAccountEvent>(_onWithdrawMoneyFromAccountEvent);
  }

  void _onTransferMoneyToOtherAccountEvent(
    TransferMoneyToOtherAccountEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    final transaction =
        await _transactionRepositoryImp.transferMoneyFromAccount(
      phoneNumber: event.phoneNumber,
      amount: event.amount,
    );

    emit(state.copyWith(transactionsTransferModel: transaction));
  }

  void _onWithdrawMoneyFromAccountEvent(
    WithdrawMoneyFromAccountEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    final transaction =
        await _transactionRepositoryImp.withDrawMoneyFromAccount(
      phoneNumber: event.phoneNumber,
      amount: event.amount,
    );

    emit(state.copyWith(transactionsWithDrawModel: transaction));
  }
}
