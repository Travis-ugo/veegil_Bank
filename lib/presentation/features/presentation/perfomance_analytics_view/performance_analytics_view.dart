import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veegil_bank_app/core/core_widgets/section_title_widget.dart';
import 'package:veegil_bank_app/core/core_widgets/transaction_history_tile_widget.dart';
import 'package:veegil_bank_app/presentation/features/domain/data_from_database/transaction_models.dart';

class PerformanceAnalyticsView extends StatelessWidget {
  const PerformanceAnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    BarChartData barChartData = BarChartData(
      alignment: BarChartAlignment.start,
      maxY: 120,
      barGroups: [
        BarChartGroupData(
          x: 1,
          barsSpace: 0,
          barRods: [
            // for (var i = 0; i < 4; i++)
            // BarChartRodData(
            //   toY: 100,
            //   fromY: 0,
            //   color: Colors.blue,
            //   width: 40,
            //   borderRadius:const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
            // ),
            // BarChartRodData(
            //   toY: 100,
            //   fromY: 0,
            //   color: Colors.pink,
            // ),
            BarChartRodData(
              toY: 100,
              fromY: 0,
              color: Colors.purple,
            ),
          ],
        ),
        BarChartGroupData(
          x: 9,
          barRods: [
            BarChartRodData(
              toY: 22,
              fromY: 0,
              color: Colors.green,
            ),
          ],
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          const SectionTitleWidget(
            smallTitle: 'Optimize perfoemances',
            largeSubTitle: 'Analytics',
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(CupertinoIcons.creditcard),
                    Text(
                      "**** 5432",
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                    ),
                    Icon(
                      CupertinoIcons.chevron_down,
                      size: 20,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SectionTitleWidget(
            smallTitle: "Total Amount",
            largeSubTitle: "21,023.45 USD",
            smallTitleFontSize: 14,
            largeTitleFontSize: 28,
          ),
          const SizedBox(height: 20),
          Container(
            height: 200,
            width: 200,
            color: Colors.white24,
            child: BarChart(
              barChartData,

              swapAnimationDuration:
                  const Duration(milliseconds: 500), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            ),
          ),
          const SizedBox(height: 30),
          const SectionTitleWidget(
            smallTitle: 'Credit Card',
            largeSubTitle: 'History',
          ),
          const SizedBox(height: 20),
          for (var i = 0; i < 3; i++)
            TransactionHistoryTileWidget(
              transactionsModelData: TransactionsModelData(
                type: TransactionType.debit,
                amount: 1002.0,
                phoneNumber: '09055758751',
                created: DateTime.now(),
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
