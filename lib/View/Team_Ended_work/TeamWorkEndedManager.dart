import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'package:flutter/material.dart';
import 'package:proof_tech_app/AppLayer/Provider.dart';
import 'package:proof_tech_app/logs/LogsManager.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'Myvalidation.dart';
//import 'UserService.dart';
import 'dart:io';


class TeamWorkEndedManager with Myvalidation {


  final lessHours = BehaviorSubject<String>();
  final moreHours = BehaviorSubject<String>();


  Stream<String> get lesshours$ => lessHours.stream.transform(passwordLength);
  Sink<String> get inLessHours => lessHours.sink;

  Stream<String> get morehours$ => moreHours.stream.transform(passwordLength);
  Sink<String> get inmoreHours => moreHours.sink;





  Stream<bool> get isFormValidCheck$ {

    if(lessHours.hasValue) {
      print("the real lessHours is _${lessHours.value} ");
    }
    if(moreHours.hasValue) {
      print("the real moreHours   is ${moreHours.value} ");
    }
    if(lessHours.hasValue) {
      return CombineLatestStream([lesshours$], (values) => true);
    }
    if(lessHours.hasValue) {
      return CombineLatestStream([morehours$], (values) => true);
    }


    return CombineLatestStream([lesshours$], (values) => true);

  }






  // Stream<bool> get isUserAuth$ async* {
  //   print("inside isUserAUTH  ");
  //   //UserProfileManager manager_user = new UserProfileManager();
  //   String query = "email=${lessHours.value}&password=${moreHours.value}";
  //
  //   print('query is this ${query}');
  // }


}
