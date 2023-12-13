
import 'package:flutter/material.dart';

class TransactionInfoWidget extends StatelessWidget {
  const TransactionInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "First Text",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text("Second text"),
        ],
      ),
    );
  }
}
