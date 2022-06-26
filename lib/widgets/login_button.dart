import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  late String loginBtnTxt;
  late String imgLogin;

  LoginButton({required this.loginBtnTxt, required this.imgLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xff5492FD),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Image(width: 60, height: 60, image: AssetImage(imgLogin)),
          SizedBox(
            width: 30,
          ),
          Text(
            loginBtnTxt,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
