// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veegil_bank_app/core/core_widgets/menu_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        MenuIcon(),
        Spacer(),
        LeadingAppBar(
          childWidget: Icon(CupertinoIcons.bell),
        ),
        SizedBox(width: 10),
        LeadingAppBar(
          childWidget: Icon(CupertinoIcons.person),
        ),
      ],
    );
  }
}

class LeadingAppBar extends StatelessWidget {
  const LeadingAppBar({super.key, required this.childWidget});

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
        color: Colors.black12,
        shape: BoxShape.circle,
      ),
      child: childWidget,
    );
  }
}

class CustomerInfomationWidget extends StatelessWidget {
  final Widget childWidget;
  final String widgetLabel;
  final VoidCallback onTap;
  const CustomerInfomationWidget(
      {super.key,
      required this.childWidget,
      required this.widgetLabel,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              fixedSize: const Size(70, 70),
              backgroundColor: Colors.black12,
              shape: const CircleBorder(),
            ),
            child: Center(
              child: childWidget,
            ),
          ),
          const SizedBox(height: 5),
          Text(widgetLabel),
        ],
      ),
    );
  }
}



