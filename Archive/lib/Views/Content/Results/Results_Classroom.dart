// ignore_for_file: file_names, non_constant_identifier_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart' show Get, GetNavigation;
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../Services/API/Api.dart';
import '../../../Services/Functions/Variables.dart';
//import '../../../admob/AdmobAndroid.dart';
import '../../../admob/AdmobIos.dart';
import '../../Elements.dart';
import 'Gender_Selection.dart';

class Results_Classroom extends StatefulWidget {
  final String cityname;
  final String cityid;

  const Results_Classroom({
    Key? key,
    required this.cityname,
    required this.cityid,
  }) : super(key: key);

  @override
  _Results_ClassroomState createState() => _Results_ClassroomState();
}

class _Results_ClassroomState extends State<Results_Classroom> {
  @override
  void initState() {
    // SetState_Classroom = _update;
    // B4.load();
    GetServerApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.cityname),
          centerTitle: true,
        ),
        body: ListView(
          children: [
//space --------------- ^^^^^^^^^^^^^^^
            const SizedBox(height: 10),
//space --------------- ^^^^^^^^^^^^^^^

//TitlePage --------------- ^^^^^^^^^^^^^^^
            TitlePages(
              name: 'Browse classes'.tr,
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
//Data --------------- ^^^^^^^^^^^^^^^
// ignore: prefer_is_empty
                  if (classesDataServer.isEmpty)
                    loadingDataClass
                  else
                    for (var i = 0; i < classesDataServer.length; i++)
                      Column(
                        children: [
//Row Data --------------- ^^^^^^^^^^^^^^^
                          classesDataServer[i]['ads'] == '1'
                              ? Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: B4C,
                                )
                              : GestureDetector(
                                  onTap: () => Get.to(Gender_Selection(
                                        cityname: widget.cityname,
                                        cityid: widget.cityid,
                                        calssid: classesDataServer[i]['id'],
                                        Classname: classesDataServer[i]
                                            ['classname'],
                                      )),
                                  child: Container(
                                    height: 114,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(-10.0, 0.0),
                                          color: Colors.black.withOpacity(.1),
                                          blurRadius: 20.0)
                                    ]),
                                    margin: const EdgeInsets.only(bottom: 15),
                                    child: Stack(children: [
                                      Positioned(
                                          child: Container(
                                        margin: LangSet
                                            ? const EdgeInsets.only(
                                                right: 40, bottom: 0)
                                            : const EdgeInsets.only(
                                                left: 40, bottom: 0),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.80,
                                        decoration: BoxDecoration(
                                          color: Get.theme.backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(children: [
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              margin: LangSet
                                                  ? const EdgeInsets.only(
                                                      right: 80)
                                                  : const EdgeInsets.only(
                                                      left: 80),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: GetAutoSizeText(
                                                        classesDataServer[i]
                                                            ['classname'],
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                        18,
                                                        'Cairo-Bold'),
                                                  ),
                                                  Flexible(
                                                    child: GetAutoSizeText(
                                                        "Total".tr +
                                                            ' : ' +
                                                            classesDataServer[i]
                                                                    [
                                                                    'count_exam']
                                                                .toString(),
                                                        Theme.of(context)
                                                            .textTheme
                                                            .headline3!
                                                            .color,
                                                        14,
                                                        'CairoSemiBold'),
                                                  ),
                                                  const Divider(
                                                    height: 6,
                                                    thickness: 1,
                                                    indent: 1,
                                                    endIndent: 20,
                                                  ),
                                                  Flexible(
                                                    child: GetAutoSizeText(
                                                        'Last updated'.tr +
                                                            ' : ' +
                                                            classesDataServer[i]
                                                                    [
                                                                    'last_date_exam']
                                                                .toString(),
                                                        Theme.of(context)
                                                            .textTheme
                                                            .headline4!
                                                            .color,
                                                        14,
                                                        'CairoSemiBold'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]),
                                      )),
                                      LangSet
                                          ? Positioned(
                                              right: -20,
                                              top: -11,
                                              child: SizedBox(
                                                  child: Image.asset(
                                                      'assets/class_img/c' +
                                                          classesDataServer[i][
                                                                  'classnumber']
                                                              .toString() +
                                                          '.png'),
                                                  height: 135,
                                                  width: 150),
                                            )
                                          : Positioned(
                                              left: -20,
                                              top: -11,
                                              child: SizedBox(
                                                  child: Image.asset(
                                                      'assets/class_img/c' +
                                                          classesDataServer[i][
                                                                  'classnumber']
                                                              .toString() +
                                                          '.png'),
                                                  height: 135,
                                                  width: 150),
                                            ),
                                    ]),
                                  )),
//Row Data --------------- ^^^^^^^^^^^^^^^

//space --------------- ^^^^^^^^^^^^^^^
                          const SizedBox(height: 1),
//space --------------- ^^^^^^^^^^^^^^^
                        ],
                      ),
                ],
              ),
            ),

//space --------------- ^^^^^^^^^^^^^^^
            const SizedBox(height: 20),
//space --------------- ^^^^^^^^^^^^^^^
          ],
        ));
  }
}
