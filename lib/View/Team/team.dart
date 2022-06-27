import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'package:proof_tech_app/logs/LogsManager.dart';

import '../../AppLayer/Provider.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  int tabbedIndex = -1;
  bool isPresent = false;
  @override
  Widget build(BuildContext context) {
    LogsManager manager = Provider.of(context).fetch(LogsManager);

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
                color: Colors.green,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextButton(
                onPressed: () {
              //    Get.to(ProjectScreen());
                },
                child: Text(
                  "Project C",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          )
        ],
        title: Text(
          "Team",
          style: TextStyle(fontFamily: 'poppins'),
        ),
        iconTheme: IconThemeData(color: Colors.white),
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
                            height: Get.height * .18,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          color:  Overseer.myteamList[index].roleId.contains("4") ? Colors.deepOrangeAccent
                              : Colors.white,

                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (){
                                Get.back();
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                               // color:Colors.green  ,
                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/waleed.jpeg'),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Overseer.myteamList[index].fName +" " +Overseer.myteamList[index].lName , style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1
                                ),),
                                Text(Overseer.myteamList[index].roleId.contains("5") ?" ${Overseer.myteamList[index].roleId} - Worker" : "${Overseer.myteamList[index].roleId} -- SuperVisor", style: TextStyle(
                                    fontFamily: 'poppins',

                                    letterSpacing: 1
                                )),
                                SizedBox(height: 20,),
                                tabbedIndex == index ? Text("joined at ${new DateTime.now()} ",style:isPresent == true ? TextStyle(fontSize: 25,
                                 color:  Colors.green) :TextStyle(fontSize: 25,
                                    color:  Colors.red)
                                ) :
                                Row(
                                  children: [
                                    Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.25,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Center(
                                        child: StreamBuilder<Object>(
                                          stream: manager.isRollCallTapped$,
                                          builder: (context, snapshot) {

                                            if(snapshot.hasError) {

                                            }
                                            return TextButton(
                                              onPressed: () {
                                                tabbedIndex = index;
                                                isPresent =  false;
                                                manager.inLogType.add(
                                                    "Expense_ADDED");
                                                manager.isReallyTapped$.listen((
                                                    event) async {
                                                  print("actually tapped");
                                                });
                                                setState(() {

                                                });
                                               //  Get.back();
                                              },
                                              child: Text(
                                                "Absent",
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            );
                                          }
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.25,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () {
                                            tabbedIndex = index;
                                            isPresent =  true;
                                            setState(() {

                                            });
                                          },
                                          child: Text(
                                            "Present",
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )

                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ));
            }),

      ),

    );
  }
}
