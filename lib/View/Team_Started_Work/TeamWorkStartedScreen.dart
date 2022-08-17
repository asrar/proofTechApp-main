import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'package:proof_tech_app/logs/LogsManager.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../AppLayer/Provider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

import '../home/home_screen.dart';

class TeamWorkStartedScreen extends StatefulWidget {
  const TeamWorkStartedScreen({Key? key}) : super(key: key);

  @override
  _TeamWorkStartedScreenState createState() => _TeamWorkStartedScreenState();
}

class _TeamWorkStartedScreenState extends State<TeamWorkStartedScreen> {
  int tabbedIndex = -1;
  bool isPresent = false;
  @override
  Widget build(BuildContext context) {
    LogsManager manager = Provider.of(context).fetch(LogsManager);
    Overseer.setTodayDate();
    int hour = new DateTime.now().hour;

    print("need of the hour is ${hour}");
    if(hour==6 ) {
      //setTodaysTeamRollCallText();
    }
    //setTodaysTeamRollCallText();sia

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xffeb5f30),
        actions: [
          Container(
            height: Get.height * 0.03,
            width: Get.width * 0.25,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Get.to(HomeScreen());
                },
                child: Text(
                  Overseer.projectName,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),

        ],
        title: Text(
          "Work Started",
          style: TextStyle(fontFamily: 'poppins'),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        leading: Column(
          children: [
            SizedBox(
              height: Get.height * 0.001,
            ),
            Container(
              height: Get.height * 0.097,
              width: Get.width * 0.99,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: EdgeInsets.only(bottom: 25),

                child: TextButton(
                  onPressed: () {
                  //  removePreviousRollCall();

                    Overseer.teamActivityAssigned.clear();
                    print("-- after clear length is ${Overseer.teamActivityAssigned.length} *************");

                    validForWorkStartedToday();
                    tabbedIndex = 0;
                    isPresent = true;
                    setState(() {});
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: ListView.builder(
            itemCount: Overseer.myteamList.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                          elevation: 5,
                          child: Container(
                            height: Get.height * .26,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                              color: Overseer.myteamList[index].roleId
                                      .contains("4")
                                  ? Colors.deepOrangeAccent
                                  : Colors.white,
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    // color:Colors.green  ,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/waleed.jpeg'),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Overseer.myteamList[index].fName +
                                          " " +
                                          Overseer.myteamList[index].lName,
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                        Overseer.myteamList[index].roleId
                                                .contains("5")
                                            ? "Worker"
                                            : "SuperVisor",
                                        style: TextStyle(
                                            fontFamily: 'poppins',
                                            letterSpacing: 1)),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    tabbedIndex == index
                                        ? Flexible(
                                          child: Text("${Overseer.teamActivityAssigned[Overseer.myteamList[index].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[index].fName + " " +
                                          Overseer.myteamList[index].lName]} ",
                                                  maxLines: 2,
                                                  softWrap: false,
                                                  overflow: TextOverflow.fade,

                                          style: isPresent == true
                                                  ? TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.green)
                                                  : TextStyle(

                                                      fontSize: 15,
                                                      color: Overseer.myteamList[index].roleId
                                                          .contains("4") ? Colors.green : Colors.orange)),
                                        )
                                        : Row(
                                            children: [
                                              Container(
                                                height: Get.height * 0.05,
                                                width: Get.width * 0.55,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(5)),
                                                child: Center(
                                                  child: StreamBuilder<Object>(
                                                      stream: manager
                                                          .isRollCallTapped$
                                                          .asStream(),
                                                      builder:
                                                          (context, snapshot) {



                                                        // manager.inLogType.add("leave this");


                                                        print(
                                                            " ${index}-if key >> ${Overseer.myteamList[index].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[index].fName + " " +
                                                                Overseer.myteamList[index].lName}");

                                                        print(
                                                            " ${index} - if check >> ${Overseer.teamActivityAssigned[Overseer.myteamList[index].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[index].fName + " " +
                                                                Overseer.myteamList[index].lName]}");



                                                        return snapshot.hasData
                                                            ? Overseer.teamActivityAssigned[Overseer.myteamList[index].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[index].fName + " " +
                                                            Overseer.myteamList[index].lName] == "-" ?
                                                        TextButton(
                                                                onPressed: () async{
                                                                  tabbedIndex = index;
                                                                  print(" ${index}--tab ind ${tabbedIndex} live activity *************and length is ${Overseer.teamActivityAssigned.length} *************");

                                                                  print("--setting tabbed key ${Overseer.myteamList[tabbedIndex].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[tabbedIndex].fName + " " +
                                                                      Overseer.myteamList[tabbedIndex].lName}");
                                                                  print("--setting tabbed value ${Overseer.myActiveActicity}");

                                                                  Overseer.teamActivityAssigned[Overseer.myteamList[tabbedIndex].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[tabbedIndex].fName + " " +
                                                                      Overseer.myteamList[tabbedIndex].lName] = Overseer.myActiveActicity ;

                                                                  print("just valued and length is ${Overseer.teamActivityAssigned.length}");
                                                                  print(Overseer.teamActivityAssigned.containsKey(Overseer.myteamList[tabbedIndex].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[tabbedIndex].fName + " " +
                                                                      Overseer.myteamList[tabbedIndex].lName));
                                                                  print("all keys");
                                                                  print(Overseer.teamActivityAssigned.keys);

                                                                  setTodaysTeamAssigned(Overseer.myteamList[tabbedIndex].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[tabbedIndex].fName + " " +
                                                                      Overseer.myteamList[tabbedIndex].lName,Overseer.myActiveActicity);

                                                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                  prefs.setString(Overseer.myteamList[tabbedIndex].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[tabbedIndex].fName + " " +
                                                                      Overseer.myteamList[tabbedIndex].lName,Overseer.myActiveActicity );



                                                                  print(Overseer.myteamList);
                                                                  print("---------<<<${index}>>>>>--------");
                                                                  print(Overseer.teamRollCallTime);
                                                                  print("---------<<<${Overseer.myteamList[index].fName + " " +
                                                 Overseer.myteamList[index].lName+"-"+Overseer.myteamList[index].id.toString()}>>>>>--------");

                                                                  Overseer.teamRollCallTime[Overseer.myteamList[index].fName + " " +
                                                                      Overseer.myteamList[index].lName+"-"+Overseer.myteamList[index].id.toString()] = getTime();

                                                                 // Overseer.iSTodayRollCallDone = true;

                                                                //  SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                //  prefs.setInt("",1);


                                                                  // tabbedIndex = index;
                                                                  isPresent =
                                                                      false;
                                                                  if (snapshot
                                                                      .hasData) {
                                                                    // adding Type
                                                                    manager.inLogType.add(Overseer.logKeys[20]);
                                                                    // adding title and description
                                                                    manager.inLogDescription.add("Day Started  ${Overseer.myteamList[tabbedIndex].fName + " " +
                                                                        Overseer.myteamList[tabbedIndex].lName} on ${getToday()}");
                                                                    manager.inLogTitle.add("Day work Started .");
                                                                    // adding value for Actor1
                                                                    manager.inLogActor1.add(Overseer.supervisorName);
                                                                    manager.inLogActor1Id.add(Overseer.supervisorId);
                                                                    // adding value for Actor2
                                                                    manager.inLogActor2.add(Overseer.myteamList[tabbedIndex].fName + " " +
                                                                        Overseer.myteamList[tabbedIndex].lName);
                                                                    manager.inLogActor2Id.add(Overseer.myteamList[tabbedIndex].id);
                                                                    manager.inQuantity.add("");

                                                                    // adding value for Item1
                                                                    manager.inLogItem1.add("");
                                                                    manager.inLogItem1Id.add(0);

                                                                    // adding value for Item2
                                                                    manager.inLogItem2.add(Overseer.projectName);
                                                                    manager.inLogItem2Id.add(Overseer.projectId);

                                                                    manager.logLevel.add(1);



                                                                    manager.logger$.listen((event) async {



                                                                       print(

                                                                          "actually tapped");
                                                                    });
                                                                  } else {
                                                                    print(
                                                                        "you are late and now allowed now to enter team member Roll Call");
                                                                  }
                                                                  setState(
                                                                      () {

                                                                      });
                                                                  //  Get.back();
                                                                },
                                                                child: Text(
                                                                  "Assign work",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ):
                                                        Text("${Overseer.teamActivityAssigned[Overseer.myteamList[index].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[index].fName + " " +
                                                            Overseer.myteamList[index].lName]}")
                                                            : Text(
                                                                "NOT ALLOWED");
                                                      }),
                                                ),
                                              ),

                                            ],
                                          ),

                                  ],
                                )
                                ,

                              ],
                            ),
                          )

                      )


                    ],
                  ));
            }),
      ),
    );
  }
  String getToday(){
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  String getTime(){
    var now = new DateTime.now();
    var formatter = new DateFormat('hh:mm:ss a ');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  void setTodaysTeamAssigned(String member,String activity) async {

    print("member name is: ${member}");
    print("activity name is: ${activity}");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(member,activity);

    Overseer.teamActivityAssigned[member] = activity;


  }

  void setTodaysTeamTime(String member,String present) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(member,present);
    Overseer.teamStartWorkToday[member] = present;

    print("resetting");
    print(Overseer.teamRollCallTime);

  }


  Future<bool> validForWorkStartedToday() async {

    if(Overseer.teamActivityAssigned.length == 0) {
     int length = Overseer.myteamList.length;
     for(int i=0;i<length;i++) {
       Overseer.teamActivityAssigned[Overseer.myteamList[i].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[i].fName + " " +
           Overseer.myteamList[i].lName]="-";
       print("setting value");
       print(Overseer.teamActivityAssigned[Overseer.myteamList[i].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[i].fName + " " +
           Overseer.myteamList[i].lName]);
     }
    }
    print("all keys are:");
    print(Overseer.teamActivityAssigned.keys);

    return true;
  }


  Future<void> removePreviousRollCall() async {

    for(int i = 0 ; i<= Overseer.myteamList.length;i++) {
    setTodaysTeamAssigned(Overseer.myteamList[i].fName + " " +
        Overseer.myteamList[i].lName+"-"+Overseer.myteamList[i].id.toString(),"-");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Overseer.myteamList[i].fName + " " +
        Overseer.myteamList[i].lName+"-"+Overseer.myteamList[i].id.toString(), "-");

    setTodaysTeamTime(Overseer.myteamList[i].fName + " " +
        Overseer.myteamList[i].lName+"-"+Overseer.myteamList[i].id.toString(),"-");


  }
  }



}
