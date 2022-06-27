import 'package:proof_tech_app/View/logs/logsview.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'dart:async';
import 'package:proof_tech_app/logs/LogsService.dart';

class LogsManager  {

  final logType = BehaviorSubject<String>();
  final logTitle = BehaviorSubject<String>();
  final logDescription = BehaviorSubject<String>();
  final logActor1 = BehaviorSubject<String>();
  final logActor2 = BehaviorSubject<String>();
  final logItem1 = BehaviorSubject<String>();
  final logItem2 = BehaviorSubject<String>();
  final logLevel = BehaviorSubject<String>();


  Stream<String> get logType$ => logType.stream;
  Stream<String> get logtitle$ => logTitle.stream;
  Stream<String> get logDescription$ => logDescription.stream;
  Stream<String> get logActor1$ => logActor1.stream;
  Stream<String> get logActor2$ => logActor2.stream;
  Stream<String> get logItem1$ => logItem1.stream;
  Stream<String> get logItem2$ => logItem2.stream;
  Stream<String> get logLevel$ => logLevel.stream;


  Sink<String> get inLogType => logType.sink;
  Sink<String> get inLogTitle => logTitle.sink;
  Sink<String> get inLogDescription => logDescription.sink;
  Sink<String> get inLogActor1 => logActor1.sink;
  Sink<String> get inLogActor2 => logActor2.sink;
  Sink<String> get inLogItem1 => logItem1.sink;
  Sink<String> get inLogItem2 => logItem2.sink;
  Sink<String> get inLogLevel => logLevel.sink;

  
  Future<bool> get isRollCallTapped$ {

    inLogType.add("required");
    print("--- from first method ${logType.hasValue}");

    if(logType.hasValue) {
     print(" ---- real taped value is "+logType.value);
    }else {
     
    }
   if(logType.value.contains("required")){
     return  logType$.contains("required");
   }else{
     return  logType$.contains("not Allowed");
   }


     //CombineLatestStream([logType$], (values) => true);
  }


   Stream<bool> get isReallyTapped$ async* {

    print("inside isUserAUTH  1 ");
    if (logType.value != null ) {

      print('query is this from new stream "${logType.value}"');
      yield await LogsService.browse("");
    }
  }



}

