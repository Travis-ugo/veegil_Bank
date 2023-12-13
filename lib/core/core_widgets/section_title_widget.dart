import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  final String smallTitle;
  final String largeSubTitle;
  final double smallTitleFontSize;
  final double largeTitleFontSize;
  final FontWeight largeTitleFontWeight;
  final Widget? trailingWidget;

  const SectionTitleWidget({
    Key? key,
    this.smallTitle = '',
    this.largeSubTitle = '',
    this.smallTitleFontSize = 16,
    this.largeTitleFontSize = 44,
    this.trailingWidget,
    this.largeTitleFontWeight = FontWeight.w600,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          smallTitle,
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: smallTitleFontSize),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              largeSubTitle,
              style: TextStyle(
                fontWeight: largeTitleFontWeight,
                fontSize: largeTitleFontSize,
              ),
            ),
            SizedBox(
              child: trailingWidget,
            )
          ],
        ),
      ],
    );
  }
}
