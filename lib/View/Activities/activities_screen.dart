import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proof_tech_app/View/Activities/activity_details.dart';
import 'package:proof_tech_app/View/Team_Ended_work/TeamWorkEndedScreen.dart';
import 'package:proof_tech_app/View/Team_Started_Work/TeamWorkStartedScreen.dart';
import 'package:proof_tech_app/View/home/home_screen.dart';
import 'package:proof_tech_app/logs/LogsManager.dart';

import '../../AppLayer/Overseer.dart';
import '../../AppLayer/Provider.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: myGlobals.scaffoldKey,
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
                     Get.offAll(HomeScreen());
                },
                child: Text(
                  Overseer.projectName,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          )
        ],
        title:  Text(
          "${Overseer.myProjectActicity}",
          style: TextStyle(fontFamily: 'poppins'),
        ),
        leading: Column(
          children: [
            SizedBox(
              height: Get.height * 0.025,
            ),
             Text(
              "",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              itemCount: Overseer.myActivities.length,
              itemBuilder: (context, index) {
              return  Card(
                  child: ExpansionTile(
                    iconColor: Color(0xffeb5f30),
                    textColor: Color(0xffeb5f30),
                    title: Text(
                      Overseer.myActivities[index],
                      style: TextStyle(
                          fontFamily: 'poppins', fontWeight: FontWeight.w900),
                    ),
                    children: [
                      GestureDetector(
                          onTap: () {
                            //     Get.to(ActivityDetailScreen());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        fontFamily: 'poppins',
                                        letterSpacing: 1),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [

                                            RichText(
                                              text: TextSpan(
                                                  text: 'WORK DATE   ',
                                                  style: TextStyle(
                                                      fontFamily: 'poppins',
                                                      fontWeight: FontWeight.bold,

                                                      letterSpacing: 3,
                                                      color: Colors.deepOrange),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                        getToday(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            color:
                                                            Color(0xffeb5f30)))
                                                  ]),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: 'Start Time:   ',
                                                  style: TextStyle(
                                                      fontFamily: 'poppins',
                                                      letterSpacing: 1,
                                                      color: Colors.black),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                        getTime(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            color:
                                                            Color(0xffeb5f30)))
                                                  ]),
                                            ),
                                            // SizedBox(
                                            //   height: 10,
                                            // ),
                                            // RichText(
                                            //   text: TextSpan(
                                            //       text: 'End Time',
                                            //       style: TextStyle(
                                            //           fontFamily: 'poppins',
                                            //           letterSpacing: 1,
                                            //           color: Colors.black),
                                            //       children: [
                                            //         TextSpan(
                                            //             text: '',
                                            //             style: TextStyle(
                                            //                 fontWeight:
                                            //                 FontWeight.w500,
                                            //                 color:
                                            //                 Color(0xffeb5f30)))
                                            //       ]),
                                            // ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 50),
                                              child: Container(
                                                //padding: EdgeInsets.only(left: 30),
                                                height: Get.height * 0.060,
                                                width: Get.width * 0.50,
                                                decoration: BoxDecoration(
                                                    color: Colors.deepOrange,
                                                    borderRadius:
                                                    BorderRadius.circular(15)),
                                                child: Center(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Overseer.myActiveActicity = Overseer.myActivities[index];
                                                      Get.to(
                                                          ActivityDetailScreen());
                                                    },
                                                    child: Text(
                                                      "Monitor Team",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 50),
                                              child: Container(
                                                height: Get.height * 0.060,
                                                width: Get.width * 0.50,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                    BorderRadius.circular(15)),
                                                child: Center(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Overseer.myActiveActicity = Overseer.myActivities[index];
                                                      Get.to(

                                                          TeamWorkStartedScreen());
                                                    // logActivity(context,"Work Started","Activity work",Overseer.myActivities[index] +" Has been started ");

                                                    },
                                                    child: Text(
                                                      "Assign Team Member",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // Stop work
                                            SizedBox(
                                              height: 15,
                                            ),
                                            // Container(
                                            //   padding: EdgeInsets.only(left: 50),
                                            //   child: Container(
                                            //     height: Get.height * 0.060,
                                            //     width: Get.width * 0.50,
                                            //     decoration: BoxDecoration(
                                            //         color: Colors.red,
                                            //         borderRadius:
                                            //         BorderRadius.circular(15)),
                                            //     child: Center(
                                            //       child: TextButton(
                                            //         onPressed: () {
                                            //           Overseer.myActiveActicity = Overseer.myActivities[index];
                                            //           Get.to(
                                            //
                                            //               TeamWorkEndedScreen());
                                            //           //   logActivity(context,"Work Started","Activity work",Overseer.myActivities[index] +" Has been started ");
                                            //
                                            //         },
                                            //         child: Text(
                                            //           "End Work Today",
                                            //           style: TextStyle(
                                            //               color: Colors.black),
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),

                                          ],
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ))
                    ],
                  ));
              }
          ),
    ),
    );
}
  String getToday(){
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  String getTime(){
    var now = new DateTime.now();
    var formatter = new DateFormat('hh:mm:ss a ');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  bool logActivity(BuildContext context,String type,String title,String activityName) {

    LogsManager logger = Provider.of(context).fetch(
        LogsManager);

    logger.inLogType.add("team_project_rolecall");
    // adding title and description
    logger.inLogTitle.add(" ${type}: \" ${title} \"  on  \" ${activityName} \" .");
    logger.inLogDescription.add("type.");
    // adding value for Actor1
    logger.inLogActor1.add(Overseer.supervisorName);
    logger.inLogActor1Id.add(Overseer.supervisorId);
    // adding value for Actor2

    logger.inLogActor2.add("");
    logger.inLogActor2Id.add(0);

    // adding value for Item1
    logger.inLogItem1.add("");
    logger.inLogItem1Id.add(0);

    // adding value for Item2
    logger.inLogItem2.add(Overseer.projectName);
    logger.inLogItem2Id.add(Overseer.projectId);

    logger.logLevel.add(1);

    print(" Pre call of event ");
    logger.logger$.listen((event) async {

      print(" post call of event ");
      Get.snackbar(type,
        title
        ,
        dismissDirection: DismissDirection.horizontal,
        isDismissible: true,
        backgroundColor: Colors.deepOrange,
        duration: Duration(seconds: 2),

      );

    });
    return true;
  }

}
