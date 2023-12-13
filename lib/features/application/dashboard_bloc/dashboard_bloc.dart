import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:veegil_bank_app/features/domain/data_from_database/accounts_list_models.dart';
import 'package:veegil_bank_app/features/domain/data_from_database/transaction_models.dart';
import 'package:veegil_bank_app/features/infrastructure/data_from_database/data_from_database_repository_imp.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DataFromDataBaseModelImp _dataFromDataBaseModelImp;

  DashboardBloc({
    required DataFromDataBaseModelImp dataFromDataBaseModelImp,
  })  : _dataFromDataBaseModelImp = dataFromDataBaseModelImp,
        super(const DashboardState()) {
    on<GetListOfUserTransactionsEvent>(_onGetListOfUserTransactionsEvent);
    on<GetListOfAccountsEvent>(_getListOfAccounts);
  }

  Future _onGetListOfUserTransactionsEvent(
    GetListOfUserTransactionsEvent event,
    Emitter<DashboardState> emit,
  ) async {
    var userTransactions =
        await _dataFromDataBaseModelImp.getListOfUserTransactions();

    emit(state.copyWith(
        transactionsModel: TransactionsModel(
      status: userTransactions.status,
      data: userTransactions.data,
    )));
  }

  Future _getListOfAccounts(
    GetListOfAccountsEvent event,
    Emitter<DashboardState> emit,
  ) async {
    var userTransactions = await _dataFromDataBaseModelImp.getListOfAccounts();

    emit(
      state.copyWith(
        accountsListModel: AccountsListModel(
          status: userTransactions.status,
          message: userTransactions.message,
          data: userTransactions.data,
        ),
      ),
    );
  }
}
