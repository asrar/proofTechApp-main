import 'dart:async';
import 'dart:convert';
import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'package:http/http.dart' as http;

import 'LoginModel.dart';

// import 'LogInModel.dart';
// import 'package:dio/dio.dart';

class UserService {
  static Future<bool> browse(String query) async {
    //  Overseer over = new Overseer();
    print("-- AUTH SERVICE BROWSE METHOD 1.2");
    http.Response response;
    String _url = "";
    if (query != null && query.isNotEmpty) {
      _url = 'https://s3bits.com/rooftech/api/v1/auth/supervisor/login?${query}';
      print("// final USER URL   hhh  >>>" + _url);
      response = await http.post(Uri.parse(_url), headers: {
        'Access-Control-Allow-Origin': '*',
        'Accept': 'application/json',
        'Content-type': 'application/json',

      });
    } else {
      response = await http.post(Uri.parse(_url), headers: {
        'Access-Control-Allow-Origin': '*',
        'Accept': 'application/json',
        'Content-type': 'application/json',
      });
    }
    print("getting for url " + _url);
    print("-- 1st Request status code 111111 ${response.statusCode}");

    //  response = await http.get(_url,headers: {'Access-Control-Allow-Origin': '*'});
    String content = response.body;
    Overseer.printWrapped("WRAPPED PRINTING STARTS HERE ------ " + content);
    if (response.statusCode != 200) {
      print(
          "########################## Error #####################################");

      //  print( '----------- token ---------->${cookie_token_value}<<<<<');
      print(
          "------------------------------------------------------------------------");
      print(
          "------------------------------------------------------------------------");
      //   print( '----------- session ---------->>${session_value}<<<<<');
      print(
          "############################## end #################################");
      Overseer.login_status = "user-not-exist";
      Overseer.is_user_valid = false;

      return false;
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
          Overseer.login_status = "user-not-exist";
          Overseer.is_user_valid = false;

          print("login status from service " + Overseer.login_status);
        } else {
          Overseer.login_status = "verified-user";
          Overseer.is_user_valid = true;
          List collection = json.decode(arr);
          print("user login parsing start");
          List<LoginModel> _userList =
              collection.map((json) => LoginModel.fromJson(json)).toList();
          print("user login parisng end");
        //  Overseer.userName = _userList[0].data.name+" "+_userList[0].data.email;
          Overseer.userId = _userList[0].data.id;
          print("Over seer User ID ${Overseer.userId} Sign In User ID ${_userList[0].data.Projects1.length}");
          Overseer.userName = _userList[0].data.fName  +" "+ _userList[0].data.lName;
          Overseer.supervisorName = _userList[0].data.fName  +" "+ _userList[0].data.lName;
          Overseer.supervisorId = _userList[0].data.id;
          Overseer.projectName = _userList[0].data.Projects1[0].name;
          Overseer.myteamList = _userList[0].data.Projects1[0].team;
          print("login status from service else  ${_userList[0].data.fName}  ${_userList[0].data.lName}  "
              "by ${_userList[0].data.Projects1[0].team[1].fName }");
        }

        print("end of listen with status " + Overseer.login_status);
      } catch (NoSuchMethodError) {
        print("NoSuchMethodError caught ..hahahaha  ${NoSuchMethodError}");
      }
      return true;
    } // end of main top if ( does not contain error )
  }

  /////-----------------------------------------------

  static Future<bool> browseCustomer() async {
    print(
        "##########################  22222222  start #####################################");

    print(
        "############################## end #################################");
    http.Response response;
    String _url = "";

    var token1;
    if (token1 != null && token1.isNotEmpty) {
      print("// QUERY URL  token1 >>>" + token1);
      print(
          "// QUERY URL  csrf >>> 1-1 END-END " + Overseer.csrf_token_overseer);
      _url = 'https://newshop.welldoneapps.net/jsonapi/basket?id=default';
      response = await http.get(Uri.parse(_url), headers: {
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer sdfhshfksdjhksdfhksdhf',
        'Accept': 'application/json',
        'X-CSRF-TOKEN': '${Overseer.csrf_token_overseer}',
      });
    } else {
      response = await http
          .get(Uri.parse(""), headers: {'Access-Control-Allow-Origin': '*'});
    }

    print("getting for url " + _url);
    String content = response.body;
    if (content.contains("Error:")) {
      return false;
    } else {
      var jString = [content];
      print("CUSTOMER DATA CUSTOMER DATA  >>>1 " +
          content.substring(content.lastIndexOf("attributes")));

      String arr = jString.toString();
      List collection = json.decode(arr);
      print("//printig from service >>>2 ");
      print("testing ");

      return true;
    } // end of main top if ( does not contain error )
  }

  /// get the OPtions from requests

  ///////-----------------------------------------------

  static Future browseOptionsCSRF() async {
    var content;
    if (content.contains("Error:")) {
      // auth_user.authenticated = false;
      return false;
    } else {
      var jString = [""];
      print("CUSTOMER DATA CUSTOMER DATA  >>>1 " +
          content.substring(content.lastIndexOf("attributes")));

      String arr = jString.toString();
      List collection = json.decode(arr);
      print("//printig from service >>>2 ");

      print("testing options done");


      return true;
    } // end of main top if ( does not contain error )
  }

}
