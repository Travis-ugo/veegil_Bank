// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veegil_bank_app/features/app.dart';
import 'package:veegil_bank_app/features/application/authentication_bloc/authentication_bloc.dart';
import 'package:veegil_bank_app/features/presentation/authentication/sign_up/sign_up_page.dart';

import 'package:veegil_bank_app/features/presentation/authentication/widgets/input_field.dart';
import 'package:veegil_bank_app/features/presentation/authentication/widgets/primary_button.dart';
import 'package:veegil_bank_app/features/presentation/authentication/widgets/remeber_me_checker.dart';

// ScaffoldMessenger.of(context)
//   ..hideCurrentSnackBar()
//   ..showSnackBar(
//     SnackBar(
//       content: Text(state.errorMessage ?? 'Authentication Failure'),
//     ),
//   );

class SigninForm extends StatelessWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
      if (state.authStatus.contains("success")) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VeegilAppView(),
            ));
      }
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
        child: ListView(
          children: [
            const Icon(
              CupertinoIcons.creditcard_fill,
              size: 60,
              color: Colors.purpleAccent,
            ),
            const SizedBox(height: 10),
            const Text(
              'Log in',
              style: TextStyle(
                fontSize: 31,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Log in to your bank account',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            _PhoneNumberInput(
              onChanged: (String phoneNumber) {
                context.read<AuthenticationBloc>().add(
                      PhoneNumberChangedEvent(phoneNumber),
                    );
              },
            ),
            _PassWordInput(
              onChanged: (String password) {
                context
                    .read<AuthenticationBloc>()
                    .add(PasswordChangedEvent(password));
              },
            ),
            const SizedBox(height: 20),
            const RemeberMeCheckerWidget(),
            const SizedBox(height: 20),
            AuthPrimaryButton(
              buttonLabel: 'sign in',
              onTap: () {
                context
                    .read<AuthenticationBloc>()
                    .add(SubmitAuthFormButtonLoginEvent());
              },
            ),
            const SizedBox(height: 15),
            AuthPrimaryButton(
              fillButton: false,
              buttonLabel: 'sign up',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(),
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput({super.key, required this.onChanged});

  final Function(String phoneNumber) onChanged;

  @override
  Widget build(BuildContext context) {
    return InputAuthForm(
      errorState: false,
      hintText: 'Phone Number',
      label: 'phoneNumber',
      onChanged: onChanged,
    );
  }
}

class _PassWordInput extends StatelessWidget {
  const _PassWordInput({super.key, required this.onChanged});

  final Function(String password) onChanged;

  @override
  Widget build(BuildContext context) {
    return InputAuthForm(
      errorState: false,
      hintText: 'password',
      label: 'Password',
      onChanged: onChanged,
    );
  }
}
