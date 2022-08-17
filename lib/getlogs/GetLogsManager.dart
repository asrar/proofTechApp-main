import 'package:proof_tech_app/View/logs/logsview.dart';
import 'package:proof_tech_app/getlogs/GetLogsModel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'dart:async';
import 'package:proof_tech_app/getlogs/GetLogsService.dart';

class GetLogsManager  {

  Stream<List<GetLogsModel>> get logsList async* {

    yield await GetLogsService.log();
  }


}

