import 'package:flutter/material.dart';

class InputAuthForm extends StatelessWidget {
  final Function(String) onChanged;
  final String hintText;

  final bool errorState;
  final String label;
  const InputAuthForm({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.errorState,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          TextField(
            key: const Key('signin_form_field'),
            onChanged: onChanged,
            decoration: InputDecoration(
              label: Text(hintText, style: const TextStyle(color:  Colors.grey),),
              contentPadding: const EdgeInsets.all(18),
              border: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(15.0),
              ),
              errorText: errorState ? 'invalid input' : null,
            ),
          ),
        ],
      ),
    );
  }
}
