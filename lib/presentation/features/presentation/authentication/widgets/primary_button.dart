
import 'package:flutter/material.dart';

class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({
    Key? key,
    required this.onTap,
    required this.buttonLabel,
    this.fillButton = true,
  }) : super(key: key);

  final VoidCallback onTap;
  final String buttonLabel;
  final bool fillButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      key: Key(buttonLabel),
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: fillButton ? Colors.grey[900] : Colors.transparent,
        padding: const EdgeInsets.all(16),
        minimumSize: const Size(double.infinity, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
          side: const BorderSide(),
        ),
      ),
      child: Text(
        buttonLabel,
        style: TextStyle(
          color: fillButton ? Colors.white : Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
