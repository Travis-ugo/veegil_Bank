// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:veegil_bank_app/core/core_widgets/transaction_history_tile_widget.dart';
import 'package:veegil_bank_app/presentation/features/domain/data_from_database/transaction_models.dart';

class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({
    super.key,
    required this.transactionListdata,
  });

  final List<TransactionsModelData> transactionListdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Transactions",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Text("current History"),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: transactionListdata.length,
              itemBuilder: (context, index) {
                return TransactionHistoryTileWidget(
                  transactionsModelData: TransactionsModelData(
                    type: transactionListdata[index].type,
                    amount: transactionListdata[index].amount,
                    phoneNumber: transactionListdata[index].phoneNumber,
                    created: DateTime.now(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
