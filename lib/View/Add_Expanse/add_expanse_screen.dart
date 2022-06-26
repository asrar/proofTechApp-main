import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_textField.dart';


class AddExpanseScreen extends StatefulWidget {
  const AddExpanseScreen({Key? key}) : super(key: key);

  @override
  _AddExpanseScreenState createState() => _AddExpanseScreenState();
}

class _AddExpanseScreenState extends State<AddExpanseScreen> {
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
        title: const Text("Add expanses",style: TextStyle(
          fontFamily: 'poppins'
        ),),
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
                "Water Scheme",
                style: TextStyle(
                    color: Color(0xffeb5f30),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    fontSize: 20),
              ),
              SizedBox(
                height: 6,
              ),
              CustomTextField(
                errortext: "sample",
                onChanged: null,
                passwordTxt: false,
                textFieldText: 'Name',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                errortext: "sample",
                onChanged: null,
                passwordTxt: false,
                textFieldText: 'Reason',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                errortext: "sample",
                onChanged: null,
                passwordTxt: false,
                textFieldText: 'Cost',
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  child: TextField(
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    cursorColor: Color(0xffeb5f30),
                    decoration: InputDecoration(

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
                  )
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child:Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xffeb5f30),
                        borderRadius: BorderRadius.all(Radius.circular(10))

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
              )],
          ),
        ),
      )
    );
  }
}
