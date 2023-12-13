import 'package:flutter/material.dart';

class WidgetPageWidget extends StatelessWidget {
  const WidgetPageWidget({
    Key? key,
    required this.child,
    this.verticalEdgePadding = 11,
    this.horizontalEdgePadding = 4,
    this.widgetColor = Colors.white38,
    this.border 
  }) : super(key: key);

  final Widget child;
  final double verticalEdgePadding;
  final double  horizontalEdgePadding;
  final Color widgetColor;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding:  EdgeInsets.symmetric(vertical: verticalEdgePadding, horizontal:horizontalEdgePadding),
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color:  widgetColor ,
            borderRadius: BorderRadius.circular(30),
            border: border,
          ),
          child: child,
        ),
      ],
    );
  }
}
