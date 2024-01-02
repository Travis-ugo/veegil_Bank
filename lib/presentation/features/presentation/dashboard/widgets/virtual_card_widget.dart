import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veegil_bank_app/core/core_widgets/section_title_widget.dart';
import 'package:veegil_bank_app/presentation/features/application/authentication_bloc/authentication_bloc.dart';

class VirtualCardWidget extends StatelessWidget {
  const VirtualCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Colors.blueAccent),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(state.phoneNubmber, //"**** 7578",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 28)),
                  const Icon(
                    CupertinoIcons.creditcard,
                    size: 35,
                  ),
                ],
              ),
              const Spacer(),
              const SectionTitleWidget(
                smallTitle: "Card owner",
                largeSubTitle: "Jordan Smith",
                smallTitleFontSize: 16,
                largeTitleFontSize: 28,
                largeTitleFontWeight: FontWeight.w600,
                trailingWidget: Text(
                  "04/24",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
