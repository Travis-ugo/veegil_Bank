import 'package:flutter/cupertino.dart';
import 'package:veegil_bank_app/core/core_widgets/custom_app_bar.dart';

class SubViewAppBar extends StatelessWidget {
  const SubViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const LeadingAppBar(
            childWidget: Icon(CupertinoIcons.back),
          ),
        ),
        const Spacer(),
        const LeadingAppBar(
          childWidget: Icon(CupertinoIcons.question),
        ),
        const SizedBox(width: 10),
        const LeadingAppBar(
          childWidget: Icon(CupertinoIcons.ellipsis_vertical),
        ),
      ],
    );
  }
}
