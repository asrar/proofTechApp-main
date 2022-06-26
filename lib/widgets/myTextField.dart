import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextField extends StatefulWidget {
  final String title;
  final bool obsecure;
  final IconData icon;
  void Function(String value)? onChanged;
  final String errortext;

  MyTextField(
      {required this.errortext,
      required this.onChanged,
      required this.title,
      required this.icon,
      required this.obsecure});

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: widget.obsecure,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(
                width: 1,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(width: 1, color: Colors.grey)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(width: 1, color: Colors.grey)),
          contentPadding: EdgeInsets.all(10),
          errorText: widget.errortext,
          hintText: widget.title,
          prefixIcon: Icon(widget.icon),
        ),
      ),
    );
  }
}
