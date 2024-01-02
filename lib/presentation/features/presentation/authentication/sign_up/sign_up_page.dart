import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: SignupPage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child:  const SignupForm(),
      ),
    );
  }
}
