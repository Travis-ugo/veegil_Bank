import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import 'package:veegil_bank_app/core/core_widgets/subview_app_bar.dart';
import 'package:veegil_bank_app/presentation/features/application/transactions_bloc/transactions_bloc.dart';

class TransferToAccountView extends StatelessWidget {
  const TransferToAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountTextController = TextEditingController();
    final TextEditingController accountNumberTextController =
        TextEditingController();

    final TextEditingController transferMessageController =
        TextEditingController();

    final TextEditingController transferPinController = TextEditingController();
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
            child: ListView(
              children: [
                const Text(
                  "Send From",
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
                  widgetLabel: "Send To",
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
                  widgetLabel: "Amount To Transfer",
                  textInputType: TextInputType.number,
                  textController: amountTextController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 40),
                const Text(
                  "Referecne message",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: transferMessageController,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[800],
                  ),
                  decoration: InputDecoration(
                    hintText: "Transfer reference message",
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                BottomSheetWidgetButton(
                  buttonLabel: "Transfer",
                  formKey: formKey,
                  pinController: transferPinController,
                  onCompleted: (pin) {
                    if (pin == "2222") {
                      context.read<TransactionsBloc>().add(
                      TransferMoneyToOtherAccountEvent(
                        phoneNumber: accountNumberTextController.text,
                        amount: amountTextController.text,
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

class AmountTextInput extends StatelessWidget {
  const AmountTextInput({
    super.key,
    this.onChanged,
    required this.textController,
    required this.textInputType,
    this.inputFormatters,
    this.hintText,
    required this.widgetLabel,
  });

  final Function(String value)? onChanged;
  final TextEditingController textController;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String widgetLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widgetLabel,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
        TextField(
          onChanged: onChanged,
          keyboardType: textInputType,
          controller: textController,
          inputFormatters: inputFormatters,
          style: TextStyle(
            fontSize: 38.0,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800],
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 38),
            contentPadding: const EdgeInsets.all(10),
          ),
        ),
      ],
    );
  }
}

class BottomSheetWidgetButton extends StatelessWidget {
  const BottomSheetWidgetButton({
    super.key,
    required this.buttonLabel,
    required this.formKey,
    required this.pinController,
    this.onCompleted,
  });

  final String buttonLabel;
  final GlobalKey<FormState> formKey;
  final TextEditingController pinController;
  final Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 400,
              color: Colors.white,
              child: BottomSheetPopUpWidget(
                pinController: pinController,
                formKey: formKey,
                onCompleted: onCompleted,
              ),
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        minimumSize: const Size(150, 60),
        backgroundColor: Colors.black87,
      ),
      child: Center(
        child: Text(
          buttonLabel,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

/// This is the basic usage of Pinput
/// For more examples check out the demo directory
class BottomSheetPopUpWidget extends StatefulWidget {
  const BottomSheetPopUpWidget({
    super.key,
    required this.formKey,
    required this.pinController,
    this.onCompleted,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController pinController;
  final Function(String)? onCompleted;

  @override
  State<BottomSheetPopUpWidget> createState() => _BottomSheetPopUpWidgetState();
}

class _BottomSheetPopUpWidgetState extends State<BottomSheetPopUpWidget> {
  // final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    // widget.pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: widget.formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: widget.pinController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  validator: (value) {
                    if (value != '2222') widget.pinController.text = "";
                    return value == '2222' ? null : 'Pin is incorrect';
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: widget.onCompleted,
                  // (pin) {
                  //   //  if (pin != '2222')
                  //   debugPrint('onCompleted: $pin');
                  // },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
