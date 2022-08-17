import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'package:proof_tech_app/View/Team_Ended_work/TeamWorkEndedManager.dart';
import 'package:proof_tech_app/logs/LogsManager.dart';
import 'package:intl/intl.dart';
import 'package:proof_tech_app/widgets/CustomTextFieldSmall.dart';
import 'package:proof_tech_app/widgets/custom_textField.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../AppLayer/Provider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

import '../home/home_screen.dart';

class TeamWorkEndedScreen extends StatefulWidget {

  const TeamWorkEndedScreen({Key? key}) : super(key: key);



  @override
  _TeamWorkEndedScreenState createState() => _TeamWorkEndedScreenState();
}

class _TeamWorkEndedScreenState extends State<TeamWorkEndedScreen> {
   String lessHours = "";
   String moreHours = "";
  int tabbedIndex = -1;
  bool isPresent = false;
  TextEditingController _lessHours =  new TextEditingController();
   List<TextEditingController> _controllers = [];

   TextEditingController _moreHours =  new TextEditingController();
   List<TextEditingController> _controllersMoreHours = [];

   @override
   dispose() {
     _controllers.clear();
     _controllersMoreHours.clear();
     super.dispose();
     }

  @override
  Widget build(BuildContext context) {
    LogsManager manager = Provider.of(context).fetch(LogsManager);
    TeamWorkEndedManager managerWorkHours = Provider.of(context).fetch(TeamWorkEndedManager);
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
        title: Text(
          "Work End Today",
          style: TextStyle(fontFamily: 'poppins'),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        leading: Column(
          children: [
            SizedBox(
              height: Get.height * 0.001,
            ),
            // Container(
            //   height: Get.height * 0.051,
            //   width: Get.width * 0.79,
            //   decoration: BoxDecoration(
            //       color: Color(0xffeb5f30), borderRadius: BorderRadius.circular(5)),
            //   child: Padding(
            //     padding: EdgeInsets.only(bottom: 25),
            //
            //     child: TextButton(
            //       onPressed: () {
            //         Get.offAll(HomeScreen());
            //         //  removePreviousRollCall();
            //
            //         // Overseer.teamActivityAssigned.clear();
            //         // print("-- after clear length is ${Overseer.teamActivityAssigned.length} *************");
            //         //
            //         // validForWorkStartedToday();
            //         // tabbedIndex = 0;
            //         // isPresent = true;
            //         // setState(() {});
            //       },
            //       child: Text(
            //         "Back",
            //         style: TextStyle(color: Colors.black),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: ListView.builder(
            itemCount: Overseer.myteamList.length,
            itemBuilder: (context, index) {
              _controllers = [..._controllers,new TextEditingController()];
              _controllersMoreHours = [..._controllersMoreHours,new TextEditingController()];
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                       Container(
                            height: Get.height * .46,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Overseer.myteamList[index].roleId
                                  .contains("4")
                                  ? Colors.deepOrangeAccent
                                  : Colors.deepOrangeAccent.shade200,
                            ),
                            child: Column(
                              children: [
                                Row(
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
                                                      .contains("4") ? Colors.white : Colors.orange)),
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



                                                      return
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

                                                          } else {
                                                            print(
                                                                "you are late and now allowed now to enter team member Roll Call");
                                                          }

                                                          print("Adding DAYFULL");
                                                          logActivity(context,
                                                              Overseer.logKeys[21],
                                                              "${Overseer
                                                                  .myteamList[index]
                                                                  .fName + " " +
                                                                  Overseer
                                                                      .myteamList[index]
                                                                      .lName}",
                                                                      Overseer.myteamList[index].id,

                                                              " has worked for 8 hours  ","8",);
                                                          setState(
                                                                  () {

                                                              });

                                                          //  Get.back();
                                                        },
                                                        child: Text(
                                                          "Complete Day Work",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white),
                                                        ),
                                                      );

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
                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange.shade200,
                                        borderRadius:
                                        BorderRadius.circular(
                                            5)),
                                    height: 80,
                                    width: Get.width * 0.88,
                                  //  color: Colors.white,
                                    child: Row(
                                      children: [
                                        Container(
                                          width:180,
                                          height: 90,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(

                                              decoration: InputDecoration(
                                                  hintText: 'Less than 8 Hours',
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                                              keyboardType: TextInputType.number,


                                              controller: _controllers[index],
                                              autofocus: false,
                                              validator: (value) => (value!.isNum)! ? 'enter valid hours!': null,
                                              onChanged: (value) {
                                                print("-- less hour values is $value");
                                                setState(() => lessHours = value);
                                              },
                                            ),
                                          ),
                                        ),
                                      SizedBox(width: 20,),
                                        Container(
                                          height: Get.height * 0.05,
                                          width: Get.width * 0.28,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5)),
                                          child: TextButton(

                                              onPressed: (){

                                                print("the real tabbed value is $lessHours ");
                                                print(" --- ${Overseer.myteamList[index].fName}");
                                                logActivity(context,
                                                   Overseer.logKeys[21],
                                                    "${Overseer
                                                        .myteamList[index]
                                                        .fName + " " +
                                                        Overseer
                                                            .myteamList[index]
                                                            .lName}",Overseer.myteamList[index].id,


                                                    " has worked for ${lessHours}  hours", lessHours);



                                              },
                                              child: Text(
                                                "Less Hours",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                         ),


                                      ],

                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green.shade200,
                                        borderRadius:
                                        BorderRadius.circular(
                                            5)),
                                    height: 80,
                                    width: Get.width * 0.88,
                                    //  color: Colors.white,
                                    child: Row(
                                      children: [
                                        Container(
                                          width:190,
                                          height: 90,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(

                                              decoration: InputDecoration(
                                                  hintText: 'More than 8 Hours',
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                                              keyboardType: TextInputType.number,


                                              controller: _controllersMoreHours[index],
                                              autofocus: false,
                                              validator: (value) => (value!.isNum)! ? 'enter valid hours!': null,
                                              onChanged: (value1) {
                                                setState(() => moreHours = value1);
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Container(
                                          height: Get.height * 0.05,
                                          width: Get.width * 0.28,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5)),
                                          child: TextButton(

                                            onPressed: (){
                                              logActivity(context,
                                                  Overseer.logKeys[21],
                                                  "${Overseer
                                                      .myteamList[index]
                                                      .fName + " " +
                                                      Overseer
                                                          .myteamList[index]
                                                          .lName}",
                                                  Overseer.myteamList[index].id,
                                                  " has worked for ${moreHours} hours ", moreHours);
                                            },
                                            child: Text(
                                              "Overtime",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),


                                      ],

                                    ),
                                  ),
                                ),

                              ],
                            ),
                          )

                     // )


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


   bool logActivity(BuildContext context,String type,String team_member,int memberId,String activityName,String quantity) {

     LogsManager logger = Provider.of(context).fetch(
         LogsManager);

     logger.inLogType.add(type);
     // adding title and description
     logger.inLogTitle.add(" ${type}: .");
     logger.inLogDescription.add("type.");
     // adding value for Actor1
     logger.inLogActor1.add(Overseer.supervisorName);
     logger.inLogActor1Id.add(Overseer.supervisorId);
     // adding value for Actor2

     logger.inLogActor2.add(team_member);
     logger.inLogActor2Id.add(memberId);

     // adding value for Item1
     logger.inLogItem1.add("");
     logger.inLogItem1Id.add(0);
     logger.inQuantity.add(quantity);

     // adding value for Item2
     logger.inLogItem2.add(Overseer.projectName);
     logger.inLogItem2Id.add(Overseer.projectId);

     logger.logLevel.add(1);

     print(" Pre call of event ");
     logger.logger$.listen((event) async {

       print(" post call of event ");
       Get.snackbar(type,
           type,
         dismissDirection: DismissDirection.horizontal,
         isDismissible: true,
         backgroundColor: Colors.deepOrange,
         duration: Duration(seconds: 2),

       );

     });
     return true;
   }



}
