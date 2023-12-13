import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 2.5,
          width: 25,
          margin: const EdgeInsets.only(bottom: 5.8),
          decoration: BoxDecoration(
              color: Colors.pink, borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          height: 2.5,
          width: 35,
          margin: const EdgeInsets.only(bottom: 5.8),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          height: 2.5,
          width: 20,
          margin: const EdgeInsets.only(bottom: 2.8),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
        ),
      ],
    );
  }
}