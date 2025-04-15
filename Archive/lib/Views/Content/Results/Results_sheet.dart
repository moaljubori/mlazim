// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, duplicate_ignore, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malazim_iq/Services/Functions/Variables.dart';
import '../../../../Services/API/Api.dart';
import '../../../Services/Functions/StateMangament.dart';
import '../../Elements.dart';
import '../../../../Services/Functions/Response.dart';


class Request_sheet extends StatefulWidget {
  final String type;
  final String classesid;
  final String cityid;
  final String NameCity;
  final String NameClasses;
  const Request_sheet(
      {Key? key, required this.type, 
      required this.classesid,
      required this.cityid,
      required this.NameCity,
      required this.NameClasses,
      })
      : super(key: key);

  @override
  Request_sheetState createState() =>
      Request_sheetState();
}

class Request_sheetState extends State<Request_sheet> {
 
bool _isLoding = true;


  void _update(int o) {
    setState(() => {
      _isLoding = false
    });
  }


  @override
  void initState() {
    SetState_Request_sheet = _update;
   DataOfRequest_sheet(widget.type , widget.classesid , widget.cityid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: Colors.white,
        appBar: AppBar(
          //backgroundColor: const Color.fromRGBO(62, 168, 228, 1),
          centerTitle: true,
          title:   Text('Binding Of Iraq'.tr),
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
                  name: widget.NameCity +'-'+widget.NameClasses,
                  font: 'Cairo-Bold',
                ),
                alignment: LangSet? Alignment.centerRight :Alignment.centerLeft ),
//TitlePage --------------- ^^^^^^^^^^^^^^^,

            const SizedBox(
              height: 10,
            ),

 

            if (_isLoding == true)
              loadingDataClass
            else
              Expanded(
                  child: ListView(
                children: [
                  GridView.count(
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 15.0,
                      physics: const ScrollPhysics(),
                      primary: false,
                      padding: const EdgeInsets.all(10),
                      scrollDirection: Axis.vertical,
                      crossAxisCount:
        GetNumberViewGridBook(MediaQuery.of(context).size.width)[0],
                      childAspectRatio: GetNumberViewGridBook(MediaQuery.of(context).size.width)[1],
                      shrinkWrap: true,
                      children: List.generate(Request_sheetData.length,
                       (index) {
                        return BookCard(
                          color: Request_sheetData[index]['color'],
                          img: Request_sheetData[index]['img'],
                          name: Request_sheetData[index]['name'],
                          views: Request_sheetData[index]['date'],
                          pdf: Request_sheetData[index]['pdf'], 
                          id: Request_sheetData[index]['id'],
                           Type: 'results', fav: false,
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
