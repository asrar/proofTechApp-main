import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            itemCount: 5,
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
                          color: Colors.white,

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
                                Text("Tahir Mehmood", style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1
                                ),),
                                Text("Worker", style: TextStyle(
                                    fontFamily: 'poppins',

                                    letterSpacing: 1
                                )),
                                SizedBox(height: 20,),
                                tabbedIndex == index ? Text("joined at 9:00 AM",style:isPresent == true ? TextStyle(fontSize: 25,
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
                                        child: TextButton(
                                          onPressed: () {
                                            tabbedIndex = index;
                                            isPresent =  false;
                                            setState(() {

                                            });
                                           //  Get.back();
                                          },
                                          child: Text(
                                            "Absent",
                                            style: TextStyle(color: Colors.black),
                                          ),
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
