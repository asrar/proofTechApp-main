import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proof_tech_app/View/home/home_screen.dart';
import 'package:proof_tech_app/splash_screen.dart';
import 'package:proof_tech_app/util/app_constants.dart';
import 'package:proof_tech_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'package:proof_tech_app/AppLayer/Provider.dart' as pro;
import 'package:get/get.dart';
import 'AppLayer/Overseer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:proof_tech_app/helper/notification_helper.dart';




Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  try {
    if (GetPlatform.isMobile) {
      final RemoteMessage? remoteMessage = await FirebaseMessaging.instance.getInitialMessage();


      FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
    }
  }catch(e) {}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return pro.Provider(
        data: Overseer(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstant.APP_NAME,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
        ));
  }
}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}