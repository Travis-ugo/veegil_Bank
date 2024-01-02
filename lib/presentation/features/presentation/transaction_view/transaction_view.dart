import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:veegil_bank_app/core/core_widgets/custom_app_bar.dart';
import 'package:veegil_bank_app/core/core_widgets/section_title_widget.dart';
import 'package:veegil_bank_app/core/core_widgets/transaction_history_tile_widget.dart';
import 'package:veegil_bank_app/core/core_widgets/widget_unknow.dart';
import 'package:veegil_bank_app/presentation/features/application/dashboard_bloc/dashboard_bloc.dart';
import 'package:veegil_bank_app/presentation/features/application/transactions_bloc/transactions_bloc.dart';
import 'package:veegil_bank_app/presentation/features/domain/data_from_database/transaction_models.dart';
import 'package:veegil_bank_app/presentation/features/presentation/transaction_view/transfer_to_account_view.dart';
import 'package:veegil_bank_app/presentation/features/presentation/transaction_view/withdraw_from_account_view.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SectionTitleWidget(
                smallTitle: 'Credit Card',
                largeSubTitle: 'Total Balance',
              ),
              const WidgetPageWidget(
                horizontalEdgePadding: 14,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(CupertinoIcons.creditcard),
                    Text(
                      "**** 5432",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                    ),
                    Icon(
                      CupertinoIcons.chevron_down,
                      size: 20,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              const Center(
                  child: Text(
                "40,540.74 USD",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomerInfomationWidget(
                    childWidget: const Icon(
                      CupertinoIcons.arrow_up_right,
                      size: 25,
                      color: Colors.white,
                    ),
                    widgetLabel: 'Send',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransferToAccountView(),
                        ),
                      );
                    },
                  ),
                  CustomerInfomationWidget(
                    childWidget: const Icon(
                      CupertinoIcons.down_arrow,
                      size: 25,
                      color: Colors.white,
                    ),
                    widgetLabel: 'Withdraw',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WithdrawFromAccountView(),
                        ),
                      );
                    },
                  ),
                  CustomerInfomationWidget(
                    childWidget: const Icon(
                      CupertinoIcons.add,
                      size: 25,
                      color: Colors.white,
                    ),
                    widgetLabel: 'Add',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const SectionTitleWidget(
                smallTitle: 'Last Recepients',
                largeSubTitle: 'Send to',
              ),
              const SizedBox(height: 20),
              BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      for (var i = 0; i < 4; i++)
                        CustomerInfomationWidget(
                          childWidget: const Icon(
                            CupertinoIcons.person,
                            size: 25,
                            color: Colors.white,
                          ),
                          widgetLabel:
                              'Add', // widgetLabel: state.accountsListModel.data[i].phoneNumber,
                          onTap: () {},
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              for (var i = 0; i < 3; i++)
                BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    return TransactionHistoryTileWidget(
                      transactionsModelData: TransactionsModelData(
                        type: TransactionType.credit,
                        amount: 1002.0,
                        phoneNumber: '09055758751',
                        created: DateTime.now(),
                      ),
                    );

                    // TransactionHistoryTileWidget(
                    //   transactionsModelData: state.transactionsModel.data[i],
                    // );
                  },
                ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
