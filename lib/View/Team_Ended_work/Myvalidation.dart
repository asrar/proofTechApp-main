import 'dart:async';

mixin Myvalidation {

  static bool isEmail(String email) => email.contains('@');

  static bool isPasswordValidLength(String password) => password.length >= 4;

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      print("getting text $value 1");
      sink.add(value);
    } else {
      print("getting error text $value 2");
      sink.add("");
      sink.addError("field error");
    }
  });

  final passwordLength =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPasswordValidLength(value)) {
      sink.add(value);
    } else {
      print("password error text > $value");
      sink.add("");
      sink.addError("Password must be of 4 characters");
    }
  });
}
