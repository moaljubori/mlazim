// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Services/API/Api.dart';
import '../../admob/AdmobAndroid.dart';
import '../Content/Results/Results_Classroom.dart';
import '../Elements.dart';
import '../../../Services/Functions/Variables.dart';
import '../../../Services/Thems/Theme.dart';

//Class  --------------- ^^^^^^^^^^^^^^^
class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);
  @override
  _ResultsState createState() => _ResultsState();
}
//Class  --------------- ^^^^^^^^^^^^^^^

//UI Class  --------------- ^^^^^^^^^^^^^^^
class _ResultsState extends State<Results> {



@override
  void initState() {
    super.initState();
    B3.load();
  }


//Content  --------------- ^^^^^^^^^^^^^^^
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
 
Padding(padding: const EdgeInsets.all(10.0),child:B3C) ,
//TitlePage --------------- ^^^^^^^^^^^^^^^
            TitlePages(
            name: 'Results'.tr,
            font: 'Cairo-Bold',
          ),
//TitlePage --------------- ^^^^^^^^^^^^^^^

//space --------------- ^^^^^^^^^^^^^^^
          const SizedBox(height: 10),
//space --------------- ^^^^^^^^^^^^^^^

          Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (citysDataServer.isEmpty)
                    loadingDataClass
                  else
                    for (var i = 0; i < citysDataServer.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, left: 20, right: 20),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            boxShadow: [shadowDark],
                            gradient: list[i],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  onTap: () =>
                                  Get.to(  Results_Classroom(
                                    cityname: citysDataServer[i]['cityname'],
                                     cityid: citysDataServer[i]['id'],
                                    )
                                    
                                    ),
                                  trailing: Icon(Icons.arrow_forward_ios,
                                      color: ColorOther[i]),
                                  title: Text(
                                    citysDataServer[i]['cityname'].toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                ],
              )),
        ],
      ),
    );
  }
}
