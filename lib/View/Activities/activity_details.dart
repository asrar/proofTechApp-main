import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityDetailScreen extends StatefulWidget {
  const ActivityDetailScreen({Key? key}) : super(key: key);

  @override
  _ActivityDetailScreenState createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {

  int tabbedIndex = 0;
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
            padding: EdgeInsets.only(bottom: 30,left: 20),
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
                      "Title : Water Scheme",
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
                      "Description : this project related to water scheme, a very heavy project , this project cost estimation up to 7 M",
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
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return InkWell(
                              onTap: (){

                                tabbedIndex = index;
                                setState(() {

                                });
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
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(height: 2,),
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
                                                              'work Stopped',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors.white,
                                                                  letterSpacing: 1,
                                                                  fontFamily: 'Poppins'),
                                                            )),
                                                      ),
                                                    ))
                                            ),
                                            SizedBox(height: 2,),
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
                                                              'Work Finished',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors.white,
                                                                  letterSpacing: 1,
                                                                  fontFamily: 'Poppins'),
                                                            )),
                                                      ),
                                                    ))
                                            ),
                                            SizedBox(height: 2,),
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
                                                              'Assign Other work',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors.white,
                                                                  letterSpacing: 1,
                                                                  fontFamily: 'Poppins'),
                                                            )),
                                                      ),
                                                    ))
                                            ),

                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Card(


                                  color: index==tabbedIndex ? Colors.deepOrange : Colors.white,
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Container(



                                    margin: EdgeInsets.only(right: 12, left: 12),
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

                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text('Ahmed Shehzad', style: TextStyle(

                                      fontWeight: FontWeight.w600,

                                      letterSpacing: 1
                                    ),),
                                  ),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text('Worker', style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: 1
                                        ),),
                                      ),
                                      SizedBox(height: 15,),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Container(

                                          //padding: EdgeInsets.only(left: 30),
                                          height: Get.height * 0.045 ,
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
                                                "working",
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                ])),
                             //),
                            );
                          }),
                    )
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child:Text("Time Expected : ",style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1
                ),)),
                SizedBox(
                  height: 8,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                    child:Text("Start Time : ",style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1
                    ),)),
                SizedBox(
                  height: 8,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                    child:Text("End Time : ",style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1
                    ),)),

                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(top:10, left: 30,bottom: 10),
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
}
