

import 'package:flutter/material.dart';




class CustomTextFieldSmall extends StatefulWidget {
  late String textFieldText;
  late bool passwordTxt;
  void Function(String value)? onChanged;
  void Function()? onTapped;

  final String errortext;


  CustomTextFieldSmall({required this.textFieldText, required this.passwordTxt, required this.onChanged,required this.onTapped, required this.errortext});

  @override
  State<CustomTextFieldSmall> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFieldSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 150,
      child: TextField(
          onChanged: widget.onChanged,
          onTap: widget.onTapped,



          // style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          obscureText: widget.passwordTxt,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          cursorColor: Color(0xff5492FD),
          decoration: InputDecoration(
            errorText: widget.errortext,
            hintText: widget.textFieldText,
            labelStyle: TextStyle(
              fontFamily: 'Comfortaa',
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Color(0xff5492FD), width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
          )),
    );
  }
}
