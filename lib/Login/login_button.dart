import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  late String buttonName;
  late Color bgColor;
  late Color textColor;

  LoginButton(
      {required this.bgColor,
        required this.buttonName,
        required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: 600.0,
      child: Text(
        buttonName,
        style: TextStyle(
          fontFamily: 'Comfortaa',
          color: textColor,
          letterSpacing: 1,
          fontSize: 18.0,
        ),
      ),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff5492FD)),
          // boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
          borderRadius: BorderRadius.circular(10.0),
          color: bgColor
        // gradient: LinearGradient(
        //     colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])
      ),
    );
  }
}
