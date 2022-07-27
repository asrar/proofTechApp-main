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

class AddExpanseScreen extends StatefulWidget {
  const AddExpanseScreen({Key? key}) : super(key: key);

  @override
  _AddExpanseScreenScreenState createState() => _AddExpanseScreenScreenState();
}

class _AddExpanseScreenScreenState extends State<AddExpanseScreen> {


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
        title: const Text(
          "Add Expense",
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
                "Add Action to Project",
                style: TextStyle(
                    color: Color(0xffeb5f30),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    fontSize: 20),
              ),
              SizedBox(
                height: 6,
              ),
              StreamBuilder<String>(
                  stream: manager.title$,
                  builder: (context, snapshot) {
                    return CustomTextField(
                        onChanged: (value) {
                          manager.inTitle.add(value);
                        },
                        errortext: snapshot.error == null
                            ? ""
                            : snapshot.error.toString(),
                        textFieldText: 'xyz@gmail.com',
                        passwordTxt: false
                    );
                  }
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<String>(
                  stream: manager.reason$,
                  builder: (context, snapshot) {
                    return CustomTextField(
                        onChanged: (value) {
                          manager.inReason.add(value);
                        },
                        errortext: snapshot.error == null
                            ? ""
                            : snapshot.error.toString(),
                        textFieldText: 'Any Reason',
                        passwordTxt: false
                    );
                  }
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<int>(
                  stream: manager.cost$,
                  builder: (context, snapshot) {
                    return CustomTextField(
                        onChanged: (value) {
                          manager.inCost.add(int.parse(value));
                        },
                        errortext: snapshot.error == null
                            ? ""
                            : snapshot.error.toString(),
                        textFieldText: 'Expense Cost (Rs) ',
                        passwordTxt: false
                    );
                  }
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  child: StreamBuilder<String>(
                      stream: manager.details$,
                      builder: (context, snapshot) {
                        return TextField(
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                          cursorColor: Color(0xffeb5f30),
                          onChanged: (value) {
                            manager.inDetails.add(value);
                          },

                          decoration: InputDecoration(
                              errorText: snapshot.error == null
                                  ? ""
                                  : snapshot.error.toString(),

                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffeb5f30), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffeb5f30), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: 'Detail',
                              labelStyle: TextStyle(
                                color: Color(0xffeb5f30),
                              )
                            // hintText: 'Enter Your Name',
                          ),

                        );
                      }
                  )
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

                            logger.inLogType.add("team_project_rolecall");
                            // adding title and description
                            logger.inLogTitle.add(" Added Expense of Cost \" ${manager.cost.value} \"  for \" ${manager.title.value} \" For Reason \" ${manager.reason.value} \" "
                                " Details \" ${manager.details.value} \"  ");
                            logger.inLogDescription.add("Adding Expenses.");
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
                              if(snapshot.hasData) {
                                print(" snapshop data is ${snapshot.data} ");
                              }
                              print(" post call of event ");
                              Get.snackbar("Action Added",
                                  "Supervison has added a Action to this Project",
                                dismissDirection: DismissDirection.horizontal,
                                isDismissible: true,
                                backgroundColor: Colors.deepOrange,
                                duration: Duration(seconds: 2),
                              );

                            });


                            //   Navigator.pop(context);
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
                              'Submit', style: TextStyle(
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
              )],
          ),
        ),
      ),
    );
  }
}
