// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:veegil_bank_app/core/core_widgets/custom_app_bar.dart';
import 'package:veegil_bank_app/core/core_widgets/section_title_widget.dart';
import 'package:veegil_bank_app/core/core_widgets/subview_app_bar.dart';
import 'package:veegil_bank_app/features/domain/data_from_database/transaction_models.dart';
import 'package:veegil_bank_app/features/presentation/transaction_history/widgets/transaction_Info_widget.dart';


class TransactionHistoryDetailsView extends StatelessWidget {
  const TransactionHistoryDetailsView({
    super.key,
    required this.transactionsModelData,
  });

  final TransactionsModelData transactionsModelData;

  @override
  Widget build(BuildContext context) {
    var transactionType = transactionsModelData.type == TransactionType.debit
        ? "Sent"
        : "Recieved";

    var transactionSign =
        transactionsModelData.type.name.contains("credit") ? "+" : "-";

    var transactionIcon = transactionsModelData.type.name.contains("debit")
        ? CupertinoIcons.up_arrow
        : CupertinoIcons.down_arrow;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const SubViewAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomerInfomationWidget(
              childWidget: Icon(
                transactionIcon,
                size: 25,
                color: Colors.white,
              ),
              widgetLabel: transactionType,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            Text(
              "$transactionSign${transactionsModelData.amount} NGR",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const Text(
              "John Doe Tommy",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 8),
                      Text(
                        "Add",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
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
              ],
            ),
            const SizedBox(height: 10),
            const SectionTitleWidget(
              largeSubTitle: 'Transaction Details',
              largeTitleFontWeight: FontWeight.w500,
              largeTitleFontSize: 22,
            ),
            const SizedBox(height: 10),
            for (var i = 0; i < 4; i++) const TransactionInfoWidget(),
            const SizedBox(height: 40),
            MaterialButton(
              textColor: Colors.white,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              onPressed: () {},
              elevation: 0.0,
              color: Colors.pink,
              minWidth: 100,
              height: 50,
              child: const Text("Download reciept"),
            ),
          ],
        ),
      ),
    );
  }
}
