// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, duplicate_ignore, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malazim_iq/Services/Functions/Variables.dart';
import 'package:malazim_iq/admob/AdmobAndroid.dart';
import '../../../../Services/API/Api.dart';
import '../../../../Services/Functions/StateMangament.dart';
import '../../Elements.dart';
import '../../../../Services/Functions/Response.dart';

class Select_Subjects_Classroom extends StatefulWidget {
  final String Subjectsid;
  final String SubjectsName;
  const Select_Subjects_Classroom(
      {Key? key, required this.Subjectsid, required this.SubjectsName})
      : super(key: key);

  @override
  Select_Subjects_ClassroomState createState() =>
      Select_Subjects_ClassroomState();
}

class Select_Subjects_ClassroomState extends State<Select_Subjects_Classroom> {
  var TabButtonSelect = [false, true, false];
  late bool _isLoding = true;
  late bool _bookType = true;
  late bool _videoType = false;

  void _update(int o) {
    setState(() => {_isLoding = false});
  }

  @override
  void initState() {
    // if (dataclasssubject.isNotEmpty) {
    //   dataclasssubject.clear();
    //   setState(() {});
    // }

    SetState_Select_Subjects_Classroom = _update;
    DataOfbooks(widget.Subjectsid);
    super.initState();
    B6.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor: const Color.fromRGBO(62, 168, 228, 1),
          centerTitle: true,
          title: Text("Binding Of Iraq".tr),
          leading: Row(children: [
            IconButton(
                icon: const Icon(Icons.arrow_back, size: 28),
                onPressed: () {
                  Get.back();
                })
          ]),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),

//TitlePage --------------- ^^^^^^^^^^^^^^^
            Align(
                child: TitlePages(
                  name: widget.SubjectsName,
                  font: 'Cairo-Bold',
                ),
                alignment:
                    LangSet ? Alignment.centerRight : Alignment.centerLeft),
//TitlePage --------------- ^^^^^^^^^^^^^^^,

            Padding(padding: const EdgeInsets.all(0.0), child: B6C),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  //Button Book ^^^^^^^^^^^^^^^^^^^^^^^^^^
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: TabButtonSelect[1] == true
                                ? const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                        Color.fromRGBO(62, 168, 228, 1),
                                        Color.fromRGBO(62, 168, 228, 1)
                                      ])
                                : const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                        Color.fromRGBO(209, 234, 248, 1),
                                        Color.fromRGBO(209, 234, 248, 1)
                                      ]),
                            borderRadius: BorderRadius.circular(10)),
                        height: 45,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                _isLoding = true;
                                TabButtonSelect = [false, true, false];
                                _bookType = true;
                                _isLoding = true;
                                _videoType = false;
                              });
                              DataOfbooks(widget.Subjectsid);
                            },
                            child: Text(
                              'Book'.tr,
                              style: TextStyle(
                                  color: TabButtonSelect[1] == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Cairo-SemiBold'),
                            ))),
                  ),
//Button Book ^^^^^^^^^^^^^^^^^^^^^^^^^^
                  const SizedBox(
                    width: 7,
                  ),

//Button Binding ^^^^^^^^^^^^^^^^^^^^^^^^^^
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: TabButtonSelect[0] == true
                                ? const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                        Color.fromRGBO(62, 168, 228, 1),
                                        Color.fromRGBO(62, 168, 228, 1)
                                      ])
                                : const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                        Color.fromRGBO(209, 234, 248, 1),
                                        Color.fromRGBO(209, 234, 248, 1)
                                      ]),
                            borderRadius: BorderRadius.circular(10)),
                        height: 45,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                _isLoding = true;

                                _bookType = false;
                                _videoType = false;
                                TabButtonSelect = [true, false, false];
                              });
                              DataOfMalazim(widget.Subjectsid);
                            },
                            child: Text(
                              'Binding'.tr,
                              style: TextStyle(
                                  color: TabButtonSelect[0] == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Cairo-SemiBold'),
                            ))),
                  ),
//Button Binding ^^^^^^^^^^^^^^^^^^^^^^^^^^

                  const SizedBox(
                    width: 7,
                  ),

//Button Video ^^^^^^^^^^^^^^^^^^^^^^^^^^
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: TabButtonSelect[2] == true
                                ? const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                        Color.fromRGBO(62, 168, 228, 1),
                                        Color.fromRGBO(62, 168, 228, 1)
                                      ])
                                : const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                        Color.fromRGBO(209, 234, 248, 1),
                                        Color.fromRGBO(209, 234, 248, 1)
                                      ]),
                            borderRadius: BorderRadius.circular(10)),
                        height: 45,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                TabButtonSelect = [false, false, true];
                                _bookType = false;
                                _isLoding = true;
                                _videoType = true;
                              });
                              DataOfVideos(widget.Subjectsid);
                            },
                            child: Text(
                              'Video'.tr,
                              style: TextStyle(
                                  color: TabButtonSelect[2] == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Cairo-SemiBold'),
                            ))),
                  ),
//Button Video ^^^^^^^^^^^^^^^^^^^^^^^^^^
                ],
              ),
            ),

            if (_isLoding == true)
              loadingDataClass
            else
              Expanded(
                  child: ListView(
                children: [
                  if (_videoType == true)
                    GridView.count(
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 15.0,
                        physics: const ScrollPhysics(),
                        primary: false,
                        padding: const EdgeInsets.all(10),
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 1,
                        childAspectRatio: (2 / 2 / 1),
                        shrinkWrap: true,
                        children:
                            List.generate(dataclasssubject.length, (index) {
                          return VideoCard(
                            color: dataclasssubject[index]['color'],
                            img: dataclasssubject[index]['img'],
                            name: dataclasssubject[index]['namevideo'],
                            views: dataclasssubject[index]['views'],
                            Link: dataclasssubject[index]['link'],
                            id: dataclasssubject[index]['id'],
                            fav: false,
                          );
                        }))
                  else
                    GridView.count(
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 15.0,
                        physics: const ScrollPhysics(),
                        primary: false,
                        padding: const EdgeInsets.all(10),
                        scrollDirection: Axis.vertical,
                        crossAxisCount: GetNumberViewGridBook(
                            MediaQuery.of(context).size.width)[0],
                        childAspectRatio: GetNumberViewGridBook(
                            MediaQuery.of(context).size.width)[1],
                        shrinkWrap: true,
                        children:
                            List.generate(dataclasssubject.length, (index) {
                          return BookCard(
                            color: dataclasssubject[index]['color'],
                            img: dataclasssubject[index]['img'],
                            name: dataclasssubject[index]
                                [_bookType ? 'namebook' : 'titlemalazim'],
                            views: dataclasssubject[index]['views'],
                            pdf: dataclasssubject[index]['pdf'],
                            id: dataclasssubject[index]['id'],
                            Type: _bookType ? 'book' : 'malazim',
                            fav: false,
                          );
                        }))
                ],
              ))
          ],
        )

        // new news.news_page(),
        );
  }
}
