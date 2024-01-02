// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.transactionsModel = const TransactionsModel(data: [], status: ""),
    this.accountsListModel =
        const AccountsListModel(data: [], status: '', message: ''),
  });

  final TransactionsModel transactionsModel;
  final AccountsListModel accountsListModel;

  @override
  List<Object> get props => [transactionsModel, accountsListModel];

  DashboardState copyWith({
    TransactionsModel? transactionsModel,
    AccountsListModel? accountsListModel,
  }) {
    return DashboardState(
      transactionsModel: transactionsModel ?? this.transactionsModel,
      accountsListModel: accountsListModel ?? this.accountsListModel,
    );
  }
}
