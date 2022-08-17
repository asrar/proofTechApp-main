import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'package:proof_tech_app/getlogs/GetLogsManager.dart';

import 'GetLogsModel.dart';

class GetLogsService {
  static Future<List<GetLogsModel>> log() async {

    List<GetLogsModel> logsList = List.empty();
    http.Response response;

    String _url = "https://s3bits.com/rooftech/api/v1/auth/supervisor/getlog/${Overseer.userId}/${Overseer.projectId}";

    print("Logs calling URL is $_url");

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
          return logsList;
        } else {

          List collection = json.decode(arr);
          print("get Logs parsing start");
          logsList =
          collection.map((json) => GetLogsModel.fromJson(json)).toList();
          print("get logs parisng end");
          //  Overseer.userName = _userList[0].data.name+" "+_userList[0].data.email;
        return logsList;
        }

        print("end of listen with status " + Overseer.login_status);
      } catch (NoSuchMethodError) {
        return logsList;
        print("NoSuchMethodError caught ..hahahaha  ${NoSuchMethodError}");
      }

    } // end of main top if ( does not contain error )
    return logsList;
  }

}