import 'package:proof_tech_app/View/home/home_screen.dart';
import 'package:proof_tech_app/util/app_constants.dart';
import 'package:proof_tech_app/util/dimensions.dart';

import 'package:proof_tech_app/widgets/custom_button.dart';
import 'package:proof_tech_app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:proof_tech_app/AppLayer/Provider.dart';
import 'package:get/get.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'package:proof_tech_app/Login/UserManager.dart';

import '../../AppLayer/Overseer.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    UserManager manager = Provider.of(context).fetch(UserManager);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_LARGE,
            top: Dimensions.PADDING_SIZE_EXTRA_LARGE,
            right: Dimensions.PADDING_SIZE_LARGE,
            bottom: Dimensions.PADDING_SIZE_DEFAULT),
        child: ListView(children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  child: Text(
                    'Proof Tech Sign In',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Comfortaa',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please fill in the information to complete the sign in process',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Email Address',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 15,
                ),
                StreamBuilder<String>(
                    stream: manager.email$,
                    builder: (context, snapshot) {
                      return CustomTextField(
                          onChanged: (value) {
                            manager.inEmail.add(value);
                          },
                          errortext: snapshot.error == null
                              ? ""
                              : snapshot.error.toString(),
                          textFieldText: 'xyz@gmail.com',
                          passwordTxt: false);
                    }),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 15,
                ),
                StreamBuilder<String>(
                    stream: manager.password$,
                    builder: (context, snapshot) {
                      return CustomTextField(
                          onChanged: (value) {
                            manager.inPassword.add(value);
                          },
                          errortext: snapshot.error == null
                              ? ""
                              : snapshot.error.toString(),
                          textFieldText: 'password',
                          passwordTxt: true);
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, top: 50),
            child: StreamBuilder<Object>(
                stream: manager.isFormValid$,
                builder: (context, snapshot) {
                  print("this is first call on submit ${snapshot.hasData}");
                  return InkWell(
                    onTap: () {
                      print("this is 2nd call on submit");
                      Get.snackbar(
                        "Submitting",
                        "Verifying User Details",
                        dismissDirection: DismissDirection.horizontal,
                        isDismissible: true,
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 1),
                      );
                      print("this is 2.5 call");
                      print(" the actual datat is ${snapshot.hasData}");
                      if (snapshot.hasData) {
                        print("this is 3rd call after submit");
                        manager.isFormSubmit$.listen((event) async {
                          if (Overseer.is_user_valid) {
                            Get.snackbar(
                              "Congratulation",
                              "Successfully LogIn with Proof Tech App",
                              dismissDirection: DismissDirection.horizontal,
                              isDismissible: true,
                              backgroundColor: Colors.amber,
                              duration: Duration(seconds: 1),
                            );
                            // final SharedPreferences _sharedPreferences =
                            //     await SharedPreferences.getInstance();
                            // _sharedPreferences.setInt(
                            //     'userId', Overseer.userId);
                            Get.to(HomeScreen());
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return DoctorListScreen();
                         //   }));
                            // print("${_sharedPreferences.getInt('userId')}");

                          } else if (snapshot.hasError) {
                            Get.snackbar(
                              "Error",
                              "Get some Error..",
                              dismissDirection: DismissDirection.horizontal,
                              isDismissible: true,
                              backgroundColor: Colors.amber,
                              duration: Duration(seconds: 2),
                            );
                          }
                        });
                      } else {
                        print('This is 4th call');
                        Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                    child: CustomButton(
                        textColor: Colors.white,
                        buttonName: 'Sign in',
                        bgColor: Color(0xff5492FD)),
                  );
                }),
          ),

        ]),
      ),
    );
  }
}
