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
  final logActor1Id = BehaviorSubject<int>();
  final logActor2Id = BehaviorSubject<int>();
  final logItem1Id = BehaviorSubject<int>();
  final logItem2Id = BehaviorSubject<int>();
  final logLevel = BehaviorSubject<int>();


  Stream<String> get logType$ => logType.stream;

  Stream<String> get logtitle$ => logTitle.stream;
  Stream<String> get logDescription$ => logDescription.stream;

  Stream<String> get logActor1$ => logActor1.stream;
  Stream<String> get logActor2$ => logActor2.stream;
  Stream<String> get logItem1$ => logItem1.stream;
  Stream<String> get logItem2$ => logItem2.stream;

  Stream<int> get logActor1Id$ => logActor1Id.stream;
  Stream<int> get logActor2Id$ => logActor2Id.stream;
  Stream<int> get logItem1Id$ => logItem1Id.stream;
  Stream<int> get logItem2Id$ => logItem2Id.stream;

  Stream<int> get logLevel$ => logLevel.stream;


  Sink<String> get inLogType => logType.sink;

  Sink<String> get inLogTitle => logTitle.sink;
  Sink<String> get inLogDescription => logDescription.sink;

  Sink<String> get inLogActor1 => logActor1.sink;
  Sink<String> get inLogActor2 => logActor2.sink;
  Sink<String> get inLogItem1 => logItem1.sink;
  Sink<String> get inLogItem2 => logItem2.sink;


  Sink<int> get inLogActor1Id => logActor1Id.sink;
  Sink<int> get inLogActor2Id => logActor2Id.sink;
  Sink<int> get inLogItem1Id => logItem1Id.sink;
  Sink<int> get inLogItem2Id => logItem2Id.sink;


  Sink<int> get inLogLevel => logLevel.sink;

  
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


   Stream<bool> get logger$ async* {

    print("event called ");
    if (logType.value != null ) {

      print(' >>>>>  query is this from new stream "${logType.value}"');

     print("Actor1 is ${logActor1.value}");
     print("Actor2 is ${logActor2.value}");

     print("Item 1 is ${logItem1.value}");
     print("Item 2 is ${logItem2.value}");


    // yield false;

      yield await LogsService.log(logType.value,logTitle.value,logDescription.value,logActor1.value,logActor2.value,logActor1Id.value,
          logActor2Id.value,logItem1.value,logItem2.value,logItem1Id.value, logItem2Id.value,logLevel.value);
    }
  }



}

