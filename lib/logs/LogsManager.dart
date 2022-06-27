import 'package:proof_tech_app/View/logs/logsview.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'dart:async';
import 'package:proof_tech_app/logs/LogsService.dart';

class LogsManager  {

  final logType = BehaviorSubject<String>();
  Stream<String> get logType$ => logType.stream;


  Sink<String> get inLogType => logType.sink;
  
  Stream<bool> get isRollCallTapped$ {
    if(logType.hasValue) {
     print(" ---- real taped value is "+logType.value);
    }else {
     
    }


     return  CombineLatestStream([logType$], (values) => true);
  }


   Stream<bool> get isReallyTapped$ async* {

    print("inside isUserAUTH  1 ");
    if (logType.value != null ) {

      print('query is this from new stream "${logType.value}"');
      yield await LogsService.browse("");
    }
  }



}

