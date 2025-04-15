// ignore_for_file: camel_case_types, deprecated_member_use, non_constant_identifier_names, file_names
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:malazim_iq/admob/AdmobAndroid.dart';
import '../../../../Services/API/Api.dart';
import '../../../../Services/Functions/StateMangament.dart';
import '../../Elements.dart';
import '../../../../Services/Functions/Response.dart';
import 'Select_Subjects_Classroom.dart';

class Subjects_Show_Classroom extends StatefulWidget {
  final String classname;
  final String classid;
  const Subjects_Show_Classroom({
    Key? key,
    required this.classname,
    required this.classid,
  }) : super(key: key);

  @override
  _Subjects_Show_ClassroomState createState() =>
      _Subjects_Show_ClassroomState();
}

class _Subjects_Show_ClassroomState extends State<Subjects_Show_Classroom> {
  void _update(int o) {
    setState(() => {});
  }

  @override
  void initState() {
    super.initState();
    SetState_Subjects_Show_Classroom = _update;
    DataOfSubjects(widget.classid);
    B5.load();
  }

  @override
  Widget build(BuildContext context) {
    //------------------
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        //  backgroundColor: const Color.fromRGBO(62, 168, 228, 1),
        title: Text("Binding Of Iraq".tr),
        centerTitle: true,
      ),

      //------------ GridData
      body: ListView(
        children: [
//space --------------- ^^^^^^^^^^^^^^^
          const SizedBox(height: 10),
//space --------------- ^^^^^^^^^^^^^^^

          Padding(padding: const EdgeInsets.all(10.0), child: B5C),

//TitlePage --------------- ^^^^^^^^^^^^^^^
          TitlePages(
            name: widget.classname,
            font: 'Cairo-SemiBold',
          ),
//TitlePage --------------- ^^^^^^^^^^^^^^^

          if (subjectsDataServer.isEmpty)
            loadingDataClass
          else
//DataView --------------- ^^^^^^^^^^^^^^^
            GridView.count(
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 15.0,
              //childAspectRatio: (SizedHight(MediaQuery.of(context).size)[0] / SizedHight(MediaQuery.of(context).size)[1]),
              //controller: new ScrollController(keepScrollOffset: false),
              childAspectRatio:
                  GetNumberViewGrid(MediaQuery.of(context).size.width)[1],
              crossAxisCount:
                  GetNumberViewGrid(MediaQuery.of(context).size.width)[0],
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(15),
              children: List.generate(subjectsDataServer.length, (index) {
//Data --------------- ^^^^^^^^^^^^^^^
                return Stack(
                  children: <Widget>[
                    Positioned(
                        child: Container(
                      padding:
                          const EdgeInsets.only(top: 130, right: 10, left: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.2),
                                blurRadius: 30.0)
                          ]),
                      child: Column(
                        children: [
                          const Spacer(),
                          AutoSizeText(subjectsDataServer[index]['subjectname'],
                              minFontSize: 13,
                              maxFontSize: 15,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                primary: const Color.fromRGBO(62, 168, 228, 1),
                              ),
                              onPressed: () {
                                Get.to(Select_Subjects_Classroom(
                                  Subjectsid: subjectsDataServer[index]['id'],
                                  SubjectsName: subjectsDataServer[index]
                                      ['subjectname'],
                                ));
                              },
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Browse'.tr,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15)),
                                    const Icon(Icons.arrow_forward_ios,
                                        size: 17),
                                  ])),
                          const Spacer(),
                        ],
                      ),
                      margin: const EdgeInsets.only(top: 50),
                    )),
                    Positioned(
                        child: Container(
                      padding: const EdgeInsets.all(18),
                      child: CachedNetworkImage(
                          imageUrl: subjectsDataServer[index]['img'].toString(),
                          imageBuilder: (context, imageProvider) => Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                  ),
                                ),
                              ),
                          placeholder: (context, url) => const SizedBox(
                                child:
                                    Center(child: CircularProgressIndicator()),
                                height: 180,
                              ),
                          errorWidget: (context, url, error) => Container(
                                height: 180,
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.error,
                                  size: 50,
                                ),
                              )),
                    )),
                  ],
                );
              }),
            )
        ],
      ),
    );
  }
}
