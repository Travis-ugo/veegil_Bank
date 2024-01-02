import 'package:flutter/material.dart';

import 'signin_form.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: SigninPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: const SigninForm(),
      ),
    );
  }
}
