// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Elements.dart';
import 'Results_sheet.dart';

class Gender_Selection extends StatefulWidget {
  final String cityname;
  final String Classname;
  final String cityid;
  final String calssid;
  const Gender_Selection({
    Key? key,
    required this.cityname,
     required this.cityid, 
     required this.calssid, 
     required this.Classname,
  }) : super(key: key);

  @override
   _Gender_SelectionState createState() => _Gender_SelectionState();
}

class _Gender_SelectionState extends State<Gender_Selection> {
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
     // backgroundColor: Colors.white,
      appBar: AppBar(
        title:   Text(widget.cityname),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(width: double.infinity, height: 10),
          
//TitlePage --------------- ^^^^^^^^^^^^^^^
          Center(
          child: TitlePages(
            name: 'Choose the type'.tr,
            font: 'Cairo-Bold',
          ),
        ),

//TitlePage --------------- ^^^^^^^^^^^^^^^
          const SizedBox(width: double.infinity, height: 10),
          GridView.count(
            shrinkWrap: true,
            primary: true,
            crossAxisCount: 2,
            children: <Widget>[
              GestureDetector(
                onTap: () => Get.to(
                  Request_sheet(
                  classesid: widget.calssid, 
                  cityid: widget.cityid, 
                  NameCity: widget.cityname, 
                  NameClasses: widget.Classname, 
                  type: '1',

                )),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                              child: SizedBox(
                                  height: 100,
                                  child: Image.asset(
                                      'assets/school_img/boy.png'))),
                          Expanded(
                              child: SizedBox(
                                  child: Text('Boys'.tr,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          )))),
                        ],
                      ),
                      color: Theme.of(context).backgroundColor,
                    ),
                    decoration:  BoxDecoration(
  gradient: const LinearGradient(colors: [
    Color.fromRGBO(62, 168, 228, 1),
    Color.fromRGBO(233, 62, 110, 1),
    Color.fromRGBO(250, 175, 67, 1)
  ]),
  borderRadius: BorderRadius.circular(10),
),
                  ),
                ),
              ),
              GestureDetector(
             onTap: () => Get.to(
                  Request_sheet(
                  classesid: widget.calssid, 
                  cityid: widget.cityid, 
                  NameCity: widget.cityname, 
                  NameClasses: widget.Classname, 
                  type: '2',

                )),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                              child: SizedBox(
                                  height: 100,
                                  child: Image.asset(
                                      'assets/school_img/girl.png'))),
                          Expanded(
                              child: SizedBox(
                                  child: Text('Girls'.tr,
                                      style: const TextStyle(
                                          fontSize: 18,
                                        )))),
                        ],
                      ),
                      color: Theme.of(context).backgroundColor,
                    ),
                    decoration:  BoxDecoration(
  gradient: const LinearGradient(colors: [
    Color.fromRGBO(62, 168, 228, 1),
    Color.fromRGBO(233, 62, 110, 1),
    Color.fromRGBO(250, 175, 67, 1)
  ]),
  borderRadius: BorderRadius.circular(10),
),
                  ),
                ),
              ),
              GestureDetector(
              onTap: () => Get.to(
                  Request_sheet(
                  classesid: widget.calssid, 
                  cityid: widget.cityid, 
                  NameCity: widget.cityname, 
                  NameClasses: widget.Classname, 
                  type: '3',

                )),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                              child: SizedBox(
                                  height: 100,
                                  child: Image.asset(
                                      'assets/school_img/goup.png'))),
                          Expanded(
                              child: SizedBox(
                                  child: Text('Mixed'.tr,
                                      style: const TextStyle(
                                          fontSize: 18,
                                         )))),
                        ],
                      ),
                      color: Theme.of(context).backgroundColor,
                    ),
                    decoration:  BoxDecoration(
  gradient: const LinearGradient(colors: [
    Color.fromRGBO(62, 168, 228, 1),
    Color.fromRGBO(233, 62, 110, 1),
    Color.fromRGBO(250, 175, 67, 1)
  ]),
  borderRadius: BorderRadius.circular(10),
),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
