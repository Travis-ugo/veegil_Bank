// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veegil_bank_app/features/app.dart';
import 'package:veegil_bank_app/features/application/authentication_bloc/authentication_bloc.dart';
import 'package:veegil_bank_app/features/presentation/authentication/sign_in/signin_page.dart';
import 'package:veegil_bank_app/features/presentation/authentication/widgets/input_field.dart';
import 'package:veegil_bank_app/features/presentation/authentication/widgets/primary_button.dart';
import 'package:veegil_bank_app/features/presentation/authentication/widgets/remeber_me_checker.dart';

//  ScaffoldMessenger.of(context)
//             ..hideCurrentSnackBar()
//             ..showSnackBar(
//               SnackBar(
//                 content: Text(state.errorMessage ?? 'Authentication Failure'),
//               ),
//             );

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

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
      },
      builder: (context, state) {
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
                'Sign up',
                style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign up with to the app',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              _PhoneNumberInput(
                onChanged: (phoneNumber) {
                  context.read<AuthenticationBloc>().add(
                        PhoneNumberChangedEvent(phoneNumber),
                      );
                },
              ),
              _PasswordInput(
                onChanged: (password) {
                  context.read<AuthenticationBloc>().add(
                        PasswordChangedEvent(password),
                      );
                },
              ),
              _ConfirmPasswordInput(
                onChanged: (confirmPassword) {
                  context.read<AuthenticationBloc>().add(
                        ComfirmPasswordChangedEvent(confirmPassword),
                      );
                },
              ),
              const SizedBox(height: 10),
              const RemeberMeCheckerWidget(),
              const SizedBox(height: 10),
              AuthPrimaryButton(
                onTap: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(SubmitAuthFormButtonSignupEvent());

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const VeegilAppView(),
                  //   ),
                  // );
                },
                buttonLabel: 'sign up',
              ),
              const SizedBox(height: 15),
              AuthPrimaryButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SigninPage(),
                    ),
                  );
                },
                buttonLabel: 'sign in',
                fillButton: false,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput({required this.onChanged});
  final Function(String phoneNumber) onChanged;
  @override
  Widget build(BuildContext context) {
    return InputAuthForm(
      errorState: false,
      key: const Key("phone number"),
      hintText: 'phone number',
      label: 'phone number',
      onChanged: onChanged,
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({required this.onChanged});

  final Function(String password) onChanged;

  @override
  Widget build(BuildContext context) {
    return InputAuthForm(
      key: const Key("password"),
      errorState: false,
      hintText: 'password',
      label: 'password',
      onChanged: onChanged,
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput({required this.onChanged});

  final Function(String confirmPassword) onChanged;

  @override
  Widget build(BuildContext context) {
    return InputAuthForm(
      errorState: false,
      key: const Key("confirm password"),
      hintText: 'confirm password',
      label: 'confirm password',
      onChanged: onChanged,
    );
  }
}
