import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'package:proof_tech_app/getlogs/GetLogsManager.dart';

import 'GetMTStockModel.dart';

class GetMTStockService {
  static Future<bool> getData() async {

    List<GetMTStockModel> logsList = List.empty();
    http.Response response;
    String _url = "https://s3bits.com/rooftech/api/v1/auth/admin/getting-material";

    response = await http.post(Uri.parse(_url), headers: {
      'Access-Control-Allow-Origin': '*',
      'Accept': 'application/json',
      'Content-type': 'application/json',
    });

    String content = response.body;
    Overseer.printWrapped("WRAPPED PRINTING STARTS HERE ------ " + content);
    if (response.statusCode != 200) {

    } else {
      print(
          "########################## not error  but else #####################################");
      var jString = [content];
      //print("printig from service >>> 1-1 done"+jString.toString().substring(jString.toString().lastIndexOf("csrf_token")));

      String arr = jString.toString();
      List collection = json.decode(arr);
      print("status code logine before try"+response.statusCode.toString());
      try {
        print("status code logine inside try"+response.statusCode.toString());
        print("//printig from service >>> ");
        if (response.statusCode != 200) {
          return true;
        } else {

          List collection = json.decode(arr);
          print("get Logs parsing start >>>>>");
          logsList =
          collection.map((json) => GetMTStockModel.fromJson(json)).toList();
          print("get logs parisng end <<<<<");


           Overseer.myAdminProjects = logsList[0].data.admin_projects;
          Overseer.myAdminMaterialList = logsList[0].data.admin_materails;
          Overseer.myAdminToolList = logsList[0].data.admin_tools;

          print("--- #########  SETTING ADMIN DATA IS OK ############");
        return true;
        }

        print("end of listen with status " + Overseer.login_status);
      } catch (NoSuchMethodError) {
        return false;
        print("NoSuchMethodError caught ..hahahaha  ${NoSuchMethodError}");
      }

    } // end of main top if ( does not contain error )
    return true;
  }

}