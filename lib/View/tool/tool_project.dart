import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proof_tech_app/Login/LoginModel.dart';

import 'package:proof_tech_app/View/tool/tool_used.dart';
import 'package:proof_tech_app/View/tool/tool_used.dart';
import 'package:proof_tech_app/model/logsmodel.dart';
//import 'package:flutter/tool.dart';
import 'package:proof_tech_app/View/logs/detail_page.dart';

import '../../AppLayer/Overseer.dart';
import '../home/home_screen.dart';





class ToolsProject extends StatefulWidget {
  ToolsProject({ required this.title}) : super();

  final String title;

  @override
  _ToolsProjectState createState() => _ToolsProjectState();
}

class _ToolsProjectState extends State<ToolsProject> {
  List ?lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Tools tool) {
      Overseer.activeToolQuantityAndUnit = "";
      for(int i=0; i<tool.stock.length; i++){
        if(tool.stock[i].quantity.trim().contains("-")){
          Overseer.activeToolQuantityAndUnit = Overseer.activeToolQuantityAndUnit + "(Issued: "+
              (tool.stock[i].quantity).trim().substring(1)+"" +tool.unitTitle  +")";
        }else{
          Overseer.activeToolQuantityAndUnit = Overseer.activeToolQuantityAndUnit + " [ Returned: "+
              (tool.stock[i].quantity)+"" +tool.unitTitle  +" ]";
        }

      }
      return  ListTile(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          // leading: Container(
          //   padding: EdgeInsets.only(right: 12.0),
          //   decoration: new BoxDecoration(
          //       border: new Border(
          //           right: new BorderSide(width: 1.0, color: Colors.white24))),
          //   child: Icon(Icons.autorenew, color: Colors.white),
          // ),
          title: Text(
            tool.name,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    // child: LinearProgressIndicator(
                    //     backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    //     value: lesson.indicatorValue,
                    //     valueColor: AlwaysStoppedAnimation(Colors.deepOrange)),
                  )),
              Expanded(
                flex: 4,

                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("${Overseer.activeToolQuantityAndUnit}",
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Overseer.activeToolQuantityAndUnit = "";
            for(int i=0; i<tool.stock.length; i++){
              if(tool.stock[i].quantity.trim().contains("-")){
                Overseer.activeToolQuantityAndUnit = Overseer.activeToolQuantityAndUnit + "(Issued: "+
                    (tool.stock[i].quantity).trim().substring(1)+"" +tool.unitTitle  +")";
              }else{

                Overseer.activeToolQuantityAndUnit = Overseer.activeToolQuantityAndUnit + "[ Returned: "+
                    (tool.stock[i].quantity)+"" +tool.unitTitle  +" ]";
              }
            }

            Overseer.activeTool = tool.name;
            Overseer.activeToolId = tool.id;
            Overseer.activeUnit = tool.unitTitle;
            Get.to(ToolUsed());
          },
        );
  }

    Card makeCard(Tools tool) {

      return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: makeListTile(tool),
        ),
      );
    }

      final makeBody = Container(
        // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: Overseer.myToolList.length,
          itemBuilder: (BuildContext context, int index) {

            return makeCard(Overseer.myToolList[index]);
          },
        ),
      );

      final makeBottom = Container(
        height: 15.0,
        child: BottomAppBar(
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.blur_on, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.hotel, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.account_box, color: Colors.white),
                onPressed: () {},
              )
            ],
          ),
        ),
      );
      final topAppBar = AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Get.offAll(HomeScreen());
            },
          )
        ],
      );

      return Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: topAppBar,
        body: makeBody,
        // bottomNavigationBar: makeBottom,
      );
    }
  }


List getLessons() {
  return [
    Lesson(
        title: "Isoflex (White)",
        level: "4 buckets",
        indicatorValue: 0.33,
        price: 20,
        content:
            "Activity A has been done by team B within time."),
    Lesson(
        title: "Iso Primer",
        level: "10 Buckets",
        indicatorValue: 0.99,
        price: 50,
        content:
            "Activity A has been done by team B within time...."),
    Lesson(
        title: "FM 16 (Thinner)",
        level: "5 Liters",
        indicatorValue: 0.66,
        price: 30,
        content:
            "Activity A has been done by team B within time."),
    Lesson(
        title: "TEVO 2010",
        level: "2 Kg",
        indicatorValue: 0.66,
        price: 30,
        content:
            "Activity A has been done by team B within time.."),
    Lesson(
        title: "Backup Rod 5mm",
        level: "2 Sft",
        indicatorValue: 1.0,
        price: 50,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Engine Challenges",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Self Driving Car",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.  ")
  ];
}
