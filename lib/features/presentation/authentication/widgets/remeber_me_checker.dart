import 'package:flutter/material.dart';

class RemeberMeCheckerWidget extends StatefulWidget {
  const RemeberMeCheckerWidget({super.key});

  @override
  State<RemeberMeCheckerWidget> createState() => _RemeberMeCheckerWidgetState();
}

class _RemeberMeCheckerWidgetState extends State<RemeberMeCheckerWidget> {
  var checkBoxValue = false;
  @override

  
  Widget build(BuildContext context) {


    return Row(
      children: [
        Checkbox(
          value: checkBoxValue ,
          onChanged: (value) {
            setState(() {
              checkBoxValue = !checkBoxValue;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        const Text(
          "Remeber Me",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
        const Spacer(),
        const Text("Forgot password",  style: TextStyle(
            color: Colors.black,
        
            fontWeight: FontWeight.w600,
          ),),
      ],
    );
  }
}
