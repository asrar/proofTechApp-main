import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proof_tech_app/View/Add_Action/AddActionManager.dart';
import 'package:proof_tech_app/View/Add_Expanse/AddExpenseManager.dart';

import '../../AppLayer/Overseer.dart';
import '../../AppLayer/Provider.dart';
import '../../logs/LogsManager.dart';
import '../../widgets/custom_textField.dart';
import '../../widgets/custom_textField.dart';
import '../home/home_screen.dart';

class MaterialsUsed extends StatefulWidget {
  const MaterialsUsed({Key? key}) : super(key: key);

  @override
  _MaterialsUsedState createState() => _MaterialsUsedState();
}

class _MaterialsUsedState extends State<MaterialsUsed> {


  @override
  Widget build(BuildContext context) {
    AddExpenseManager manager = Provider.of(context).fetch(AddExpenseManager);
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
          "Material Used",
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
          padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              SizedBox(
                height: 6,
              ),

              Text(
                      Overseer.activeMaterial,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'poppins',
                          fontSize: 25),
                    ),

              SizedBox(
                height: 10,
              ),
          Text(
            Overseer.activeMaterialQuantityAndUnit,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: 'poppins',
                fontSize: 25),
          ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Material Used (${Overseer.activeUnit} )",
                style: TextStyle(
                    color: Color(0xffeb5f30),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    fontSize: 25),
              ),

              SizedBox(
                height: 30,
              ),
              StreamBuilder<String>(
                  stream: manager.cost$,
                  builder: (context, snapshot) {
                    return CustomTextField(
                        onChanged: (value) {
                          manager.inCost.add(value);
                        },
                        errortext: snapshot.error == null
                            ? ""
                            : snapshot.error.toString(),
                        textFieldText: 'Material Used Or Returned ',
                        passwordTxt: false
                    );
                  }
              ),


              SizedBox(
                height: 20,
              ),
              StreamBuilder<Object>(
                  stream: manager.isFormValidCheck$,
                  builder: (context, snapshot) {
                    //  print("-- testing submit > ${snapshot.hasData}");
                    return InkWell(
                        onTap: () {
                          // title = manager.;
                          print("the real check ${snapshot.hasData}");
                          if(snapshot.hasError){
                            Get.snackbar(
                              "Error",
                              "Get some Error..",
                              dismissDirection: DismissDirection.horizontal,
                              isDismissible: true,
                              backgroundColor: Colors.amber,
                              duration: Duration(seconds: 2),
                            );
                          }else {
                            LogsManager logger = Provider.of(context).fetch(
                                LogsManager);

                            logger.inLogType.add(Overseer.logKeys[7]);
                            // adding title and description
                            logger.inLogDescription.add(" Material USED: \" ${Overseer.activeMaterial} \"  Quantity:  \" ${manager.cost.value} ${Overseer.activeUnit} \"  has been CONSUMED.");
                            logger.inLogTitle.add("Material Used.");
                            // adding value for Actor1
                            logger.inLogActor1.add(Overseer.supervisorName);
                            logger.inLogActor1Id.add(Overseer.supervisorId);
                            // adding value for Actor2

                            logger.inLogActor2.add("Admin");
                            logger.inLogActor2Id.add(2);

                            // adding value for Item1
                            logger.inLogItem1.add(Overseer.activeMaterial);
                            logger.inLogItem1Id.add(Overseer.activeMaterialId);

                            // adding value for Item2
                            logger.inLogItem2.add(Overseer.projectName);
                            logger.inLogItem2Id.add(Overseer.projectId);

                            logger.logLevel.add(1);

                            logger.inQuantity.add(manager.cost.value);


                            logger.logLevel.add(1);

                            print(" Pre call of event ");
                            logger.logger$.listen((event) async {
                              if(snapshot.hasData) {
                                print(" snapshop data is ${snapshot.data} ");
                              }
                              print(" post call of event ");
                              Get.snackbar("Materil Used Confirmation",
                                  "Material Used for this Project"
                                ,
                                dismissDirection: DismissDirection.horizontal,
                                isDismissible: true,
                                backgroundColor: Colors.deepOrange,
                                duration: Duration(seconds: 2),

                              );

                            });


                               Navigator.pop(context);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))

                          ),
                          child: Center(
                            child: Text(
                              'Used', style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1
                            ),
                            ),
                          ),
                        )
                    );

                  }
              ),
            // button return to stock
              SizedBox(
                height: 20,
              ),
              StreamBuilder<Object>(
                  stream: manager.isFormValidCheck$,
                  builder: (context, snapshot) {
                    //  print("-- testing submit > ${snapshot.hasData}");
                    return InkWell(
                        onTap: () {
                          // title = manager.;
                          print("the real check ${snapshot.hasData}");
                          if(snapshot.hasError){
                            Get.snackbar(
                              "Error",
                              "Get some Error..",
                              dismissDirection: DismissDirection.horizontal,
                              isDismissible: true,
                              backgroundColor: Colors.amber,
                              duration: Duration(seconds: 2),
                            );
                          }else {
                            LogsManager logger = Provider.of(context).fetch(
                                LogsManager);

                            logger.inLogType.add(Overseer.logKeys[8]);
                            // adding title and description
                            logger.inLogDescription.add(" Material RETURNED: \" ${Overseer.activeMaterial} \"  Quantity:  \" ${manager.cost.value} ${Overseer.activeUnit} \"  has been RETURNED TO STORE.");
                            logger.inLogTitle.add("Material Returned.");
                            // adding value for Actor1
                            logger.inLogActor1.add(Overseer.supervisorName);
                            logger.inLogActor1Id.add(Overseer.supervisorId);
                            // adding value for Actor2
                            //TODO: need to add active tool name and id when logType  will be tool_used_or_returned
                            logger.inLogActor2.add("Admin");
                            logger.inLogActor2Id.add(2);

                            // adding value for Item1
                            logger.inLogItem1.add(Overseer.activeMaterial);
                            logger.inLogItem1Id.add(Overseer.activeMaterialId);

                            // adding value for Item2
                            logger.inLogItem2.add(Overseer.projectName);
                            logger.inLogItem2Id.add(Overseer.projectId);

                            logger.logLevel.add(1);

                            logger.inQuantity.add(manager.cost.value);

                            print(" Pre call of event ");
                            logger.logger$.listen((event) async {
                              if(snapshot.hasData) {
                                print(" snapshop data is ${snapshot.data} ");
                              }
                              print(" post call of event ");
                              Get.snackbar("Materil Returned to Store",
                                  "Supervisor ${Overseer.supervisorName} has returned tool to store"
                                ,
                                dismissDirection: DismissDirection.horizontal,
                                isDismissible: true,
                                backgroundColor: Colors.deepOrange,
                                duration: Duration(seconds: 2),
                              );

                            });


                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                              color: Color(0xffeb5f30),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))

                          ),
                          child: Center(
                            child: Text(
                              'Returned to Store', style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1
                            ),
                            ),
                          ),
                        )
                    );

                  }
              ),
              // button return to stock
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  }
                  ,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(
                            Radius.circular(10))

                    ),
                    child: Center(
                      child: Text(
                        'Cencel', style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1
                      ),
                      ),
                    ),
                  )

              )
            ],
          ),
        ),
      ),
    );
  }
}
