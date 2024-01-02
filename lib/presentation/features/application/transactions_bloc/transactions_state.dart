// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'transactions_bloc.dart';

class TransactionsState extends Equatable {
  const TransactionsState({
    this.transactionsWithDrawModel = const TransactionsWithDrawModel(
      status: '',
      message: '',
      data: TransactionsWithDrawModelData(withdrawal: 32),
    ),
    this.transactionsTransferModel = const TransactionsTransferModel(
      status: '',
      message: '',
      data: TransactionsTransferModelData(sent: 0),
    ),
  });
  final TransactionsTransferModel transactionsTransferModel;
  final TransactionsWithDrawModel transactionsWithDrawModel;

  @override
  List<Object> get props =>
      [transactionsTransferModel, transactionsWithDrawModel];

  TransactionsState copyWith({
    TransactionsTransferModel? transactionsTransferModel,
    TransactionsWithDrawModel? transactionsWithDrawModel,
  }) {
    return TransactionsState(
      transactionsTransferModel:
          transactionsTransferModel ?? this.transactionsTransferModel,
      transactionsWithDrawModel:
          transactionsWithDrawModel ?? this.transactionsWithDrawModel,
    );
  }
}
