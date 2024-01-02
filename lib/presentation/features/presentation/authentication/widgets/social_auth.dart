import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final IconData iconData;
  final Function() onPressed;
  const SocialAuthButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        key: const Key('socialAuth_button'),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(16),
          minimumSize: const Size(double.infinity, 45),
          side: const BorderSide(color:  Color.fromARGB(255, 183, 205, 212),),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: Colors.blueAccent,),
            const SizedBox(width: 15),
            const Text("Sign in with Google", style: TextStyle(color: Colors.black, fontSize: 16),),
          ],
        ));
  }
}
