import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'Myvalidation.dart';
import 'UserService.dart';
import 'dart:io';


class UserManager with Myvalidation {

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _auth = BehaviorSubject<String>();

  Stream<String> get email$ => _email.stream.transform(validateEmail);

  Sink<String> get inEmail => _email.sink;

  Stream<String> get password$ => _password.stream.transform(passwordLength);

  Sink<String> get inPassword => _password.sink;

  Stream<bool> get isFormSubmit$ async* {
    CombineLatestStream([email$, password$], (values) => true);
    print("inside isUserAUTH  1 ");
    if (_email.value != null && _password.value != null) {
      String query = "email=${_email.value}&password=${_password.value}";
      print('query is this from new stream ${query}');
      yield await UserService.browse(query);
    }
  }

  Stream<bool> get isFormValid$ {
    if(_email.hasValue) {
      print("the real email is _${_email.value} ");
    }
    if(_password.hasValue) {
      print("the real password   is ${_password.value} ");
    }

    return CombineLatestStream([email$, password$], (values) => true);
  }


  Stream<String> get login_status$ async* {
    yield await Overseer.login_status;
  }

  Stream<bool> get isValidCustomer$ async* {
    print("inside isUserAUTH  customer 2 ");

    String query = "email=${_email.value}&password=${_password.value}";

    print('query is this from new stream ${query}');


    yield await UserService.browseCustomer();
  }

  Stream<bool> get isUserAuth$ async* {
    print("inside isUserAUTH  ");
    //UserProfileManager manager_user = new UserProfileManager();
    String query = "email=${_email.value}&password=${_password.value}";

    print('query is this ${query}');
  }


}
