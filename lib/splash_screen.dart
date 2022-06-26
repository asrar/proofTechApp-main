import 'dart:async';

import 'package:proof_tech_app/util/dimensions.dart';
import 'package:proof_tech_app/Login/sign_in.dart';
import 'package:flutter/material.dart';


import '../../util/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          width: MediaQuery.of(context).size.width,
          image: AssetImage(Images.logo),
        ),
      ),
    );
  }
}
