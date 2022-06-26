import 'package:flutter/material.dart';

class ChatCounter extends StatelessWidget {
  const ChatCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius:
          BorderRadius.all(
              Radius.circular(10))),
      child: Center(
        child: Text('1',style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}
