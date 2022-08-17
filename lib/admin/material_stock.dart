import 'package:proof_tech_app/AppLayer/Overseer.dart';
import 'package:proof_tech_app/AppLayer/Provider.dart';
import 'package:proof_tech_app/admin/GetMTStockManager.dart';
import 'package:proof_tech_app/admin/GetMTStockModel.dart';
import 'package:proof_tech_app/getlogs/GetLogsManager.dart';
import 'package:proof_tech_app/getlogs/GetLogsModel.dart';
import 'package:proof_tech_app/model/logsmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:proof_tech_app/View/logs/detail_page.dart';

import '../../AppLayer/Observer.dart';





class AdminMaterialsStock extends StatefulWidget {
  AdminMaterialsStock({ required this.title}) : super();

  final String title;

  @override
  _AdminMaterialsStockState createState() => _AdminMaterialsStockState();
}

class _AdminMaterialsStockState extends State<AdminMaterialsStock> {
  List ?lessons;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GetMTStockManager manager = Provider.of(context).fetch(GetMTStockManager);

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color(0xFF3E6EA4),
      //   child: Column(
      //     children: [buildPlayer(),
      //       SizedBox(height: 10),
      //       buildPlay()],
      //   ),
      //   onPressed: () {
      //     // TODO: add the audio controls
      //
      //   //   getAudio();
      //   },
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: Observer<List<AdminMaterails>>(
              stream: manager.myAdminMaterialList,
              onSuccess: (context, data) {
                // snapshot.data ?? 0;

                List<AdminMaterails> materialStockList = Overseer.myAdminMaterialList;
                print("printing from list tile");


                return ListView.builder(
                  // for Auto-scrolling binding controller in build method
                    controller: _scrollController,
                    //  reverse: true,
                    shrinkWrap: true,

                    addAutomaticKeepAlives: true,
                    scrollDirection: Axis.vertical,
                    itemCount: materialStockList.length,
                    itemBuilder: (BuildContext context, int index) {
                      print("printing from list tile");
                      AdminMaterails materialStock = materialStockList[index];



                      return Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text(materialStock.name +" - Available Quantity -"+materialStock.quantityAvailable +
                              " - available package Quantity: "+materialStock.availablePackageQuantity +" "
                              +materialStock.unitPacakge.title
                          + "- TYpe is: "+materialStock.admintype.name),


                        ),
                      );
                    });
              },
              onWaiting: (context) {
                return Center(child: CircularProgressIndicator());
              },
              onError: (context, error) {
                print("printing error");
                print(error);
                return Center(child: Text("Please Check Internet!"));
              },
            ),
          ),


        ],
      ),
    );
  }
}

