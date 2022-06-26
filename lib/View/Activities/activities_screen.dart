import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proof_tech_app/View/Activities/activity_details.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          "Activities A",
          style: TextStyle(fontFamily: 'poppins'),
        ),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Card(
                child: ExpansionTile(
              iconColor: Color(0xffeb5f30),
              textColor: Color(0xffeb5f30),
              title: Text(
                'Removal of old WaterProofing',
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
                              'Removal of old waterproofing , Choka Tiles & Mud from the roof by suitable means',
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
                                            text: 'Start Date:',
                                            style: TextStyle(
                                                fontFamily: 'poppins',
                                                letterSpacing: 1,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                  text: '10 June 2022 9:30 AM',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xffeb5f30)))
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: 'Finished Date & Time : ',
                                            style: TextStyle(
                                                fontFamily: 'poppins',
                                                letterSpacing: 1,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                  text: '-- --',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xffeb5f30)))
                                            ]),
                                      ),

                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 90),
                                        child: Container(

                                          //padding: EdgeInsets.only(left: 30),
                                          height: Get.height * 0.060,
                                          width: Get.width * 0.30,
                                          decoration: BoxDecoration(
                                              color: Colors.deepOrange,
                                              borderRadius: BorderRadius.circular(15)),
                                          child: Center(


                                            child: TextButton(
                                              onPressed: () {
                                                Get.to(ActivityDetailScreen());
                                              },
                                              child: Text(
                                                "Monitor",
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 90),
                                        child: Container(
                                          height: Get.height * 0.060,
                                          width: Get.width * 0.30,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(15)),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: () {
                                                Get.to(ActivityDetailScreen());
                                              },
                                              child: Text(
                                                "Activity Detail",
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ))
              ],
            )),
            Card(
                child: ExpansionTile(
              iconColor: Color(0xffeb5f30),
              textColor: Color(0xffeb5f30),
              title: Text(
                'Sand Blasting of Roof',
                style: TextStyle(
                    fontFamily: 'poppins', fontWeight: FontWeight.w900),
              ),
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(ActivityDetailScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Sand Blasting of Roof by using Air Compressor with blasting equipment ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
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
                                            text: 'Start Date & time : ',
                                            style: TextStyle(
                                                fontFamily: 'poppins',
                                                letterSpacing: 1,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                  text: '-- --',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xffeb5f30)))
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: 'End Date & time : ',
                                            style: TextStyle(
                                                fontFamily: 'poppins',
                                                letterSpacing: 1,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                  text: '-- --',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xffeb5f30)))
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: Get.height * 0.060,
                                        width: Get.width * 0.30,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Center(
                                          child: TextButton(
                                            onPressed: () {
                                              Get.to(ActivityDetailScreen());
                                            },
                                            child: Text(
                                              "Activity Completed",
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: Get.height * 0.060,
                                        width: Get.width * 0.30,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Center(
                                          child: TextButton(
                                            onPressed: () {
                                              Get.to(ActivityDetailScreen());
                                            },
                                            child: Text(
                                              "Activity Detail",
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ))
              ],
            )),
            Card(
                child: ExpansionTile(
              iconColor: Color(0xffeb5f30),
              textColor: Color(0xffeb5f30),
              title: Text(
                'Chemical screeding of Roof',
                style: TextStyle(
                    fontFamily: 'poppins', fontWeight: FontWeight.w900),
              ),
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(ActivityDetailScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Cleaning of Roof by water Jet',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
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
                                            text: 'Start time : ',
                                            style: TextStyle(
                                                fontFamily: 'poppins',
                                                letterSpacing: 1,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                  text: '-- --',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xffeb5f30)))
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: 'Start Date & time : ',
                                            style: TextStyle(
                                                fontFamily: 'poppins',
                                                letterSpacing: 1,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                  text: '-- --',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xffeb5f30)))
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: Get.height * 0.060,
                                        width: Get.width * 0.30,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Center(
                                          child: TextButton(
                                            onPressed: () {
                                              Get.to(ActivityDetailScreen());
                                            },
                                            child: Text(
                                              "Start Activity",
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: Get.height * 0.060,
                                        width: Get.width * 0.30,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Center(
                                          child: TextButton(
                                            onPressed: () {
                                              Get.to(ActivityDetailScreen());
                                            },
                                            child: Text(
                                              "Activity Detail",
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ))
              ],
            )),
            Card(
                child: ExpansionTile(
              iconColor: Color(0xffeb5f30),
              textColor: Color(0xffeb5f30),
              title: Text(
                'Waterproof Coating of Roof',
                style: TextStyle(
                    fontFamily: 'poppins', fontWeight: FontWeight.w900),
              ),
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(ActivityDetailScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Application of Primer coat',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
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
                                            text: 'Start time : ',
                                            style: TextStyle(
                                                fontFamily: 'poppins',
                                                letterSpacing: 1,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                  text: '-- --',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xffeb5f30)))
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: 'Start Date & time : ',
                                            style: TextStyle(
                                                fontFamily: 'poppins',
                                                letterSpacing: 1,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                  text: '-- --',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xffeb5f30)))
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: Get.height * 0.060,
                                        width: Get.width * 0.30,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Center(
                                          child: TextButton(
                                            onPressed: () {
                                              Get.to(ActivityDetailScreen());
                                            },
                                            child: Text(
                                              "Activity Start",
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: Get.height * 0.060,
                                        width: Get.width * 0.30,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Center(
                                          child: TextButton(
                                            onPressed: () {
                                              Get.to(ActivityDetailScreen());
                                            },
                                            child: Text(
                                              "Activity Detail",
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),


                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ))
              ],
            ))
            ,
            SizedBox(height: 45,),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Color(0xffeb5f30),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        child: Center(
                            child: Text(
                              'back',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontFamily: 'Poppins'),
                            )),
                      ),
                    ))
            )
          ],
        )

      ),
    );
  }
}
