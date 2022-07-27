import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'package:flutter/material.dart';
import 'package:proof_tech_app/AppLayer/Provider.dart';
import 'package:proof_tech_app/logs/LogsManager.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'Myvalidation.dart';
//import 'UserService.dart';
import 'dart:io';


class AddActionManager with Myvalidation {


  final title = BehaviorSubject<String>();
  final reason = BehaviorSubject<String>();
  final details = BehaviorSubject<String>();

  Stream<String> get title$ => title.stream.transform(passwordLength);
  Sink<String> get inTitle => title.sink;

  Stream<String> get reason$ => reason.stream.transform(passwordLength);
  Sink<String> get inReason => reason.sink;

  Stream<String> get details$ => details.stream.transform(passwordLength);
  Sink<String> get inDetails => details.sink;



  Stream<bool> get isFormValidCheck$ {

    if(title.hasValue) {
      print("the real title is _${title.value} ");
    }
    if(reason.hasValue) {
      print("the real reason   is ${reason.value} ");
    }
    if(details.hasValue) {
      print("the real details   is ${details.value} ");
    }
    return CombineLatestStream([title$, reason$,details$], (values) => true);
  }






  // Stream<bool> get isUserAuth$ async* {
  //   print("inside isUserAUTH  ");
  //   //UserProfileManager manager_user = new UserProfileManager();
  //   String query = "email=${title.value}&password=${reason.value}";
  //
  //   print('query is this ${query}');
  // }


}
