import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veegil_bank_app/features/domain/data_from_database/transaction_models.dart';
import 'package:veegil_bank_app/features/presentation/transaction_history/transaction_history_details_view.dart';

class TransactionHistoryTileWidget extends StatelessWidget {
  const TransactionHistoryTileWidget({
    super.key,
    required this.transactionsModelData,
  });

  final TransactionsModelData transactionsModelData;

  @override
  Widget build(BuildContext context) {
    var transactionSign =
        transactionsModelData.type.name.contains("credit") ? "+" : "-";

    var transactionIcon = transactionsModelData.type.name.contains("credit")
        ? CupertinoIcons.down_arrow
        : CupertinoIcons.down_arrow;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionHistoryDetailsView(
              transactionsModelData: transactionsModelData,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(transactionIcon),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From ${transactionsModelData.phoneNumber}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const Text(
                  "Today, 17:10",
                  // "${transactionsModelData.created.toIso8601String()}",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "$transactionSign\$${transactionsModelData.amount}",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
