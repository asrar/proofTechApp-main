

import 'package:flutter/material.dart';




class CustomTextField extends StatefulWidget {
  late String textFieldText;
  late bool passwordTxt;
  void Function(String value)? onChanged;
  final String errortext;


  CustomTextField({required this.textFieldText, required this.passwordTxt, required this.onChanged, required this.errortext});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
     // width: 150,
      child: TextField(
          onChanged: widget.onChanged,


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
