import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proof_tech_app/admin/admin_home_screen.dart';
import 'package:proof_tech_app/model/project_model.dart';

import '../../AppLayer/Overseer.dart';

class AdminProjectScreen extends StatefulWidget {
  const AdminProjectScreen({Key? key}) : super(key: key);

  @override
  _AdminProjectScreenState createState() => _AdminProjectScreenState();
}

class _AdminProjectScreenState extends State<AdminProjectScreen> {
  int selected_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xffeb5f30),
        title: Text(
          " All Projects",
          style: TextStyle(fontFamily: 'Poppins', letterSpacing: 1),
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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text(
                    "Select Project",
                    style: TextStyle(
                      color: Color(0xffeb5f30),
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Overseer.myAdminProjects.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selected_index = index;
                            });
                          },
                          child: Card(
                            child: Container(
                              // height: Get.height * 0.05,
                              decoration: BoxDecoration(
                                color: selected_index == index
                                    ? Color(0xffeb5f30).withOpacity(0.3)
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(
                                        3, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: projectContainer(
                                      titleTxt:
                                      Overseer.myAdminProjects[index].name,
                                      sbTitleTxt:
                                      Overseer.myAdminProjects[index].description)),
                            ),
                          ),
                        );
                      })),
              InkWell(
                  onTap: () {

    //Overseer.userId = _userList[0].data.id;
//    print("Over seer User ID ${Overseer.userId} Sign In User ID ${_userList[0].data.Projects1.length}");
//    Overseer.userName = _userList[0].data.fName  +" "+ _userList[0].data.lName;
  //  Overseer.supervisorName = _userList[0].data.fName  +" "+ _userList[0].data.lName;
  //  Overseer.supervisorId = _userList[0].data.id;

    Overseer.myAdminProjectName = Overseer.myAdminProjects[selected_index].name;
    Overseer.myAdminProjectId = Overseer.myAdminProjects[selected_index].id;
    Overseer.projectId = Overseer.myAdminProjects[selected_index].id;
    Overseer.projectName = Overseer.myAdminProjects[selected_index].name;

    print("selected admin project is ${Overseer.projectName}");

                  Get.offAll(AdminHomeScreen());
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
                            'Select',
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
          ),
        ),
      ),
    );
  }

  Widget projectContainer(
      {required String titleTxt, required String sbTitleTxt}) {
    return ListTile(
      title: Text(titleTxt,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w900,
              letterSpacing: 1)),
      subtitle: Text(
        sbTitleTxt,
        style: TextStyle(fontFamily: 'Poppins'),
      ),
    );
  }
}
