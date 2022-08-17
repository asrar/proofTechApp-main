import 'package:proof_tech_app/admin/logsview.dart';
import 'package:proof_tech_app/admin/GetMTStockModel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'dart:async';
import 'package:proof_tech_app/admin/GetMTStockService.dart';

class GetMTStockManager  {

  Stream<bool> get myList async* {
   print("CALLING MANAGER FOR ADMIN");
    yield await GetMTStockService.getData();
  }
  Stream<List<AdminMaterails>> get myAdminMaterialList async* {
    GetMTStockService.getData();
    yield List<AdminMaterails>.empty();
  }

}

