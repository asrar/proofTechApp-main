import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proof_tech_app/View/home/home_screen.dart';

import '../../AppLayer/Overseer.dart';
import '../../AppLayer/Provider.dart';
import '../../logs/LogsManager.dart';

class ActivityDetailScreen extends StatefulWidget {
  const ActivityDetailScreen({Key? key}) : super(key: key);

  @override
  _ActivityDetailScreenState createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  int tabbedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Overseer.setTeamStatus();
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
                  Get.offAll(HomeScreen());
                },
                child: Text(
                  Overseer.projectName,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
        title: const Text(
          "Activities",
          style: TextStyle(fontFamily: 'poppins'),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: Column(
          children: [
            SizedBox(
              height: Get.height * 0.025,
            ),
            const Text(
              "",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 30, left: 20),
            margin: EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "${Overseer.myActiveActicity}",
                      style: TextStyle(
                          color: Color(0xffeb5f30),
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    )),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Description : ",
                      style: TextStyle(fontFamily: 'poppins'),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Team Members",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w800,
                          color: Color(0xffeb5f30)),
                    )),
                SizedBox(
                  height: 7,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 210,
                      child: ListView.builder(
                          itemCount: Overseer.teamActivityAssigned.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                           print("---------------- value is");
                            print(Overseer.teamActivityAssigned[Overseer.myteamList[index].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[index].fName + " " +
                               Overseer.myteamList[index].lName]);

                            print("activity is ${Overseer.myActiveActicity}");

                            if(Overseer.teamActivityAssigned[Overseer.myteamList[index].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[index].fName + " " +
                                Overseer.myteamList[index].lName] != Overseer.myActiveActicity) {
                              return Text("");
                            } else {
                              return InkWell(
                                onTap: () {
                                  tabbedIndex = index;
                                  setState(() {});
                                  print("index of tab is $index");
                                  showModalBottomSheet<void>(
                                    // context and builder are
                                    // required properties in this widget
                                    context: context,
                                    builder: (BuildContext context) {
                                      // we set up a container inside which
                                      // we create center column and display text
                                      return Container(
                                        height: 250,
                                        color: Colors.white,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 2,
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    logActivity(context,
                                                        Overseer.logKeys[18],
                                                        "${Overseer
                                                            .myteamList[index]
                                                            .fName + " " +
                                                            Overseer
                                                                .myteamList[index]
                                                                .lName}",
                                                        " has stoped work for ${Overseer
                                                            .myActiveActicity} ");

                                                    Navigator.pop(context);
                                                  },
                                                  child: Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,

                                                            vertical: 10),
                                                        child: Container(
                                                          width: MediaQuery
                                                              .of(
                                                              context)
                                                              .size
                                                              .width,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                              vertical: 10),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xffeb5f30),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .all(Radius
                                                                  .circular(
                                                                  10))),
                                                          child: Center(
                                                              child: Text(
                                                                'work Stopped',
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    color:
                                                                    Colors
                                                                        .white,
                                                                    letterSpacing: 1,
                                                                    fontFamily:
                                                                    'Poppins'),
                                                              )),
                                                        ),
                                                      ))),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    logActivity(context,
                                                        Overseer.logKeys[17],
                                                        "${Overseer
                                                            .myteamList[index]
                                                            .fName + " " +
                                                            Overseer
                                                                .myteamList[index]
                                                                .lName}",
                                                        " has stoped work for ${Overseer
                                                            .myActiveActicity} ");

                                                    Navigator.pop(context);
                                                  },
                                                  child: Align(
                                                      alignment:
                                                      Alignment.bottomCenter,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                        child: Container(
                                                          width: MediaQuery
                                                              .of(
                                                              context)
                                                              .size
                                                              .width,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                              vertical: 10),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xffeb5f30),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .all(Radius
                                                                  .circular(
                                                                  10))),
                                                          child: Center(
                                                              child: Text(
                                                                'Work Finished',
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    color:
                                                                    Colors
                                                                        .white,
                                                                    letterSpacing: 1,
                                                                    fontFamily:
                                                                    'Poppins'),
                                                              )),
                                                        ),
                                                      ))),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              InkWell(
                                                  onTap: () {

                                                    print("-- to be removed ");
                                                    print(Overseer.myteamList[tabbedIndex].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[tabbedIndex].fName + " " +
                                                        Overseer.myteamList[tabbedIndex].lName);
                                                    Overseer.teamActivityAssigned[Overseer.myteamList[tabbedIndex].id.toString()+"-"+Overseer.projectId.toString()+"-"+Overseer.myteamList[tabbedIndex].fName + " " +
                                                        Overseer.myteamList[tabbedIndex].lName] = "-";

                                                    print("yes i am here");
                                                    logActivity(context,
                                                        Overseer.logKeys[17],
                                                        "${Overseer
                                                            .myteamList[index]
                                                            .fName + " " +
                                                            Overseer
                                                                .myteamList[index]
                                                                .lName}",
                                                        " has finished work for ${Overseer
                                                            .myActiveActicity} ");

                                                    Navigator.pop(context);
                                                  },
                                                  child: Align(
                                                      alignment:
                                                      Alignment.bottomCenter,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                        child: Container(
                                                          width: MediaQuery
                                                              .of(
                                                              context)
                                                              .size
                                                              .width,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                              vertical: 10),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xffeb5f30),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .all(Radius
                                                                  .circular(
                                                                  10))),
                                                          child: Center(
                                                              child: Text(
                                                                'Assign Other work',
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    color:
                                                                    Colors
                                                                        .white,
                                                                    letterSpacing: 1,
                                                                    fontFamily:
                                                                    'Poppins'),
                                                              )),
                                                        ),
                                                      ))),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 270,
                                  width: 180,
                                  child: Card(
                                     elevation: 20.0,

                                      color: index == tabbedIndex
                                          ? Colors.deepOrange
                                          : Colors.deepOrange.shade200,
                                      child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: 12, left: 12),
                                              width: 120,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "assets/images/waleed.jpeg",
                                                      ),
                                                      fit: BoxFit.cover)),
                                              child: Text(""),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                Overseer.myteamList[index].fName +
                                                    " " +
                                                    Overseer.myteamList[index]
                                                        .lName,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                Overseer.myteamList[index].roleId
                                                    .contains("5")
                                                    ? "Worker"
                                                    : "Supervisor",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    letterSpacing: 1),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            // Container(
                                            //   padding: EdgeInsets.only(left: 10),
                                            //   child: Container(
                                            //     //padding: EdgeInsets.only(left: 30),
                                            //     height: Get.height * 0.045,
                                            //     width: Get.width * 0.30,
                                            //     decoration: BoxDecoration(
                                            //         color: Colors.green,
                                            //         borderRadius:
                                            //         BorderRadius.circular(15)),
                                            //     child: Center(
                                            //       child: TextButton(
                                            //         onPressed: () {
                                            //           // Get.to(
                                            //           //     ActivityDetailScreen());
                                            //         },
                                            //         child: Text(
                                            //           "working",
                                            //           style: TextStyle(
                                            //               color: Colors.black),
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ])),
                                ),
                                //),
                              );
                            } // else of top If
                          }),
                    )),
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      " ",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1),
                    )),
                SizedBox(
                  height: 8,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      " ",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1),
                    )),
                SizedBox(
                  height: 8,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      " ",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1),
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 30, bottom: 10),
                  height: Get.height * 0.090,
                  width: Get.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Activity Work Finished",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }


  bool logActivity(BuildContext context,String type,String title,String activityName) {

    LogsManager logger = Provider.of(context).fetch(
        LogsManager);

    logger.inLogType.add(type);
    // adding title and description
    logger.inLogTitle.add(" ${type}: \" ${title} \"  \" ${activityName} \" .");
    logger.inLogDescription.add("type.");
    // adding value for Actor1
    logger.inLogActor1.add(Overseer.supervisorName);
    logger.inLogActor1Id.add(Overseer.supervisorId);
    // adding value for Actor2

    logger.inLogActor2.add("");
    logger.inLogActor2Id.add(0);

    logger.inQuantity.add("");

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
