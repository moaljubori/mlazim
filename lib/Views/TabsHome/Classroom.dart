// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show Get, GetNavigation;
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Services/API/Api.dart';
import '../../admob/AdmobAndroid.dart';
import '../../admob/AdmobMohmmad.dart';
import '../Elements.dart';
import '../../../Services/Functions/Variables.dart';
import '../Content/Classroom_Content/Subjects_Show_Classroom.dart';

class Classroom extends StatefulWidget {
  const Classroom({Key? key}) : super(key: key);
  @override
  _ClassroomState createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {
  @override
  void initState() {
    super.initState();

    //Android Admob ----------------
    B1.load();
    B2.load();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
//space --------------- ^^^^^^^^^^^^^^^
        const SizedBox(height: 10),
//space --------------- ^^^^^^^^^^^^^^^

//Admob --------------- ^^^^^^^^^^^^^^^

        FutureBuilder(
            future: SettingsAdsFa(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const SizedBox(
                  height: 130,
                );
              } else {
                return Column(
                  children: [
                    for (var i = 0; i < snapshot.data.length; i++)
                      if (snapshot.data[i].page == 'home')
                        if (snapshot.data[i].type == 'ads')
                          Padding(
                              padding: const EdgeInsets.all(15.0), child: B1C)
                        else
                          FutureBuilder(
                              future: ADS_BANNER_MOHMMAD(),
                              builder:
                                  (BuildContext ctx, AsyncSnapshot snapshot) {
                                if (snapshot.data == null) {
                                  return const Center();
                                } else {
                                  return Container(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30),
                                      child: RturenAdmobMohmmad(snapshot));
                                }
                              }),
                  ],
                );
              }
            }),

//TitlePage --------------- ^^^^^^^^^^^^^^^
        TitlePages(
          name: "Browse classes".tr,
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
                              child: B2C,
                            )
                          : GestureDetector(
                              onTap: () => Get.to(Subjects_Show_Classroom(
                                    classid: classesDataServer[i]['id'],
                                    classname: classesDataServer[i]
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
                                    width: MediaQuery.of(context).size.width *
                                        0.80,
                                    decoration: BoxDecoration(
                                      color: Get.theme.backgroundColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          margin: LangSet
                                              ? const EdgeInsets.only(right: 80)
                                              : const EdgeInsets.only(left: 80),
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
                                                        classesDataServer[i][
                                                                'count_malazim']
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
                                                                ['last_date']
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
                                                      classesDataServer[i]
                                                              ['classnumber']
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
                                                      classesDataServer[i]
                                                              ['classnumber']
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
    );
  }
}
