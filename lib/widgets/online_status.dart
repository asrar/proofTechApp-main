import 'package:flutter/material.dart';

class OnlineStatus extends StatelessWidget {
  const OnlineStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius:
          BorderRadius.all(
              Radius.circular(10))),
    );
  }
}
