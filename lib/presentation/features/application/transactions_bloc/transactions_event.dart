// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'transactions_bloc.dart';

sealed class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object> get props => [];
}

class TransferMoneyToOtherAccountEvent extends TransactionsEvent {
  final String phoneNumber;
  final String amount;
  const TransferMoneyToOtherAccountEvent({
    required this.phoneNumber,
    required this.amount,
  });

  @override
  List<Object> get props => [phoneNumber, amount];
}


class WithdrawMoneyFromAccountEvent extends TransactionsEvent {
  final String phoneNumber;
  final String amount;
  const WithdrawMoneyFromAccountEvent({
    required this.phoneNumber,
    required this.amount,
  });

    @override
  List<Object> get props => [phoneNumber, amount];
}
