part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class GetListOfUserTransactionsEvent extends DashboardEvent {}

class GetListOfAccountsEvent extends DashboardEvent {}
