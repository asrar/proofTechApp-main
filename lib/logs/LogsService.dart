import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LogsService {
  static Future<bool> log(String logType,String logTitle,String logDescription,String logActor1,
      String logActor2,int logActor1Id,
  int logActor2Id,String logItem1,String logItem2,int logItem1Id,
  int logItem2Id,String logQuantity,int level) async {
    http.Response response;
    String _url = "https://s3bits.com/rooftech/api/v1/auth/supervisor/addlog";

    response = await http.post(Uri.parse(_url), headers: {
      'Access-Control-Allow-Origin': '*',
      'Accept': 'application/json',
      'Content-type': 'application/json',
    },body:json.encode({
      "type" : logType,
      "title" : logTitle,
      "description" : logDescription,
      "actor1" : logActor1,
      "actor1_id" : logActor1Id,
      "actor2" : logActor2,
      "actor2_id" : logActor2Id,
      "item1" : logItem1,
      "item1_id" : logItem1Id,
      "item2" : logItem2,
      "item2_id" : logItem2Id,
      "quantity" : logQuantity,
      "level" : level,
    }) );

    if(response.statusCode == 200 ){
      print("RESPONSE: ${response.body}");

      return true;
    }else{
      return false;
    }





    print("from service class 3");

  }

}