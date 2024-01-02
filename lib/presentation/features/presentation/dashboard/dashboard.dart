import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veegil_bank_app/core/core_widgets/section_title_widget.dart';
import 'package:veegil_bank_app/core/core_widgets/transaction_history_tile_widget.dart';
import 'package:veegil_bank_app/core/core_widgets/widget_unknow.dart';
import 'package:veegil_bank_app/presentation/features/application/dashboard_bloc/dashboard_bloc.dart';
import 'package:veegil_bank_app/presentation/features/domain/data_from_database/transaction_models.dart';
import 'package:veegil_bank_app/presentation/features/infrastructure/transactions/transaction_repository_imp.dart';
import 'package:veegil_bank_app/presentation/features/presentation/dashboard/widgets/virtual_card_widget.dart';
import 'package:veegil_bank_app/presentation/features/presentation/transaction_history/transaction_history_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var transactionRepositoryImp = TransactionRepositoryImp();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: <Widget>[
                SectionTitleWidget(
                  smallTitle: "Your card infomation",
                  largeSubTitle: "All Credit \nCard",
                  trailingWidget: WidgetPageWidget(
                    verticalEdgePadding: 3,
                    widgetColor: Colors.transparent,
                    border: Border.all(color: Colors.black26),
                    child: const Row(
                      children: [
                        SizedBox(width: 8),
                        Text(
                          "Add",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          CupertinoIcons.add_circled_solid,
                          size: 35,
                          color: Colors.black54,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const VirtualCardWidget(),
                const SizedBox(height: 30),
                const SectionTitleWidget(
                  smallTitle: 'Latest',
                  largeSubTitle: 'Transactions',
                ),
                GestureDetector(
                  child: const Text(
                    "view all",
                    style: TextStyle(color: Colors.purple),
                  ),
                  onTap: () {
                    state.transactionsModel.data;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionHistoryView(
                                  transactionListdata: [
                                    // for (var i = 0; i < 3; i++)
                                      TransactionsModelData(
                                        type: TransactionType.debit,
                                        amount: 1002.0,
                                        phoneNumber: '09055758751',
                                        created: DateTime.now(),
                                      ),
                                  ],
                                )));
                  },
                ),
                const SizedBox(height: 10),
                for (var i = 0; i < 3; i++)
                  TransactionHistoryTileWidget(
                    transactionsModelData: TransactionsModelData(
                      type: TransactionType.debit,
                      amount: 1002.0,
                      phoneNumber: '09055758751',
                      created: DateTime.now(),
                    ),
                  ),
                // TransactionHistoryTileWidget(transactionsModelData: state.transactionsModel.data[i],),
              ],
            ),
          ),
        );
      },
    );
  }
}
