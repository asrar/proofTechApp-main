import 'dart:async';

import 'package:proof_tech_app/View/home/home_screen.dart';
import 'package:proof_tech_app/admin/admin_home_screen.dart';
import 'package:proof_tech_app/util/dimensions.dart';
import 'package:proof_tech_app/Login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../util/images.dart';
import 'AppLayer/Overseer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String userStatus = "";
  String role = "";

  @override
  void initState() {
    super.initState();
    userLoggedIn().whenComplete(() async{
      Timer(
          Duration(seconds: 4),
              (){
            print("--- printing after splash loading ---> $userStatus");

            if(!userStatus.contains("user-logged-true") ) {
              print(" -- going to login screen ");
              Get.to(SignIn(),);
            }else{
              print("-- splash role Id is ${Overseer.roleId}");
              if(role == "admin") {

                  Get.offAll(AdminHomeScreen());

              }else {
                print(" -- going to Main screen ");
                Get.to(HomeScreen());
              }
            }
            //  Get.to(userStatus == null ?LoginScreen():BottomBar());
          }
      );
   });
  }
  Future userLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainUser = sharedPreferences.getString('username');
    var obtainRole = sharedPreferences.getString('role');
    print("Obtainer User"+"$obtainUser");
    print("Obtainer Role"+"$obtainRole");

    setState(() {
      userStatus = obtainUser.toString();
      role = obtainRole.toString();
    });
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
