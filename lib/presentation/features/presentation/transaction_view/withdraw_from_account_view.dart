import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veegil_bank_app/core/core_widgets/subview_app_bar.dart';
import 'package:veegil_bank_app/presentation/features/application/transactions_bloc/transactions_bloc.dart';
import 'package:veegil_bank_app/presentation/features/presentation/transaction_view/transfer_to_account_view.dart';

class WithdrawFromAccountView extends StatelessWidget {
  const WithdrawFromAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountTextController = TextEditingController();
    final TextEditingController accountNumberTextController =
        TextEditingController();

    final TextEditingController withdrawPinController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const SubViewAppBar(),
      ),
      body: BlocBuilder<TransactionsBloc, TransactionsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Withdraw From",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                const Text(
                  "**** 90884",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 30),
                AmountTextInput(
                  hintText: "****** 56789",
                  widgetLabel: "Withdraw To",
                  textInputType: TextInputType.number,
                  textController: accountNumberTextController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 30),
                AmountTextInput(
                  onChanged: (value) {
                    // amountTextController.text = "#$value";
                  },
                  hintText: "#3,000.0",
                  widgetLabel: "Amount To Withdraw",
                  textInputType: TextInputType.number,
                  textController: amountTextController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const Spacer(),
                BottomSheetWidgetButton(
                  buttonLabel: "Withdraw",
                  formKey: formKey,
                  pinController: withdrawPinController,
                  onCompleted: (pin) {
                    if (pin == "2222") {
                      print("pin correct, attempt to make transfer");
                      context.read<TransactionsBloc>().add(
                            WithdrawMoneyFromAccountEvent(
                              phoneNumber: accountNumberTextController.text,
                              amount:  int.parse(amountTextController.text),
                            ),
                          );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
