// ignore_for_file: camel_case_types, deprecated_member_use, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:auto_size_text/auto_size_text.dart';
import '../../Services/API/Api.dart';
import '../Elements.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white,
        appBar: AppBar(
          //  backgroundColor: const Color.fromRGBO(62, 168, 228, 1),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Get.back();
                }),
            title: Text('ملازم العراق'.tr)),
        body: Center(
          child: SizedBox(
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),

//TitlePage --------------- ^^^^^^^^^^^^^^^
                  TitlePages(
                  name: "who are we".tr,
                  font: 'Cairo-Bold',
                ),
//TitlePage --------------- ^^^^^^^^^^^^^^^

 
   SizedBox(
       height: 350,
            width: 500,
   child: Padding(
   padding: const EdgeInsets.all(30),
   child: Image.asset('assets/img/about_img.png',
   width: 250,)
   )
   ),


                   for (var i = 0; i < dataabout.length; i++)   
                   if(dataabout[i]['Privacypolicy'] == '0')  
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children:   [
                      AutoSizeText(dataabout[i]['title'],
                          style: const TextStyle(fontFamily: 'CairoSemiBold'),
                          minFontSize: 18,
                          maxFontSize: 20,
                 
                          textAlign: TextAlign.center,
                       ),
                      AutoSizeText(
                         dataabout[i]['details'],
                          minFontSize: 14,
                          maxFontSize: 18,
                    
                          textAlign: TextAlign.center,
                         )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
