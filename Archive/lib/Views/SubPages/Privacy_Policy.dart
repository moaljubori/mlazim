// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import '../../Services/API/Api.dart';
import '../Elements.dart';

class PagePrivacypolicy extends StatefulWidget {
  const PagePrivacypolicy({Key? key}) : super(key: key);
  @override
  _PagePrivacypolicyState createState() => _PagePrivacypolicyState();
}

class _PagePrivacypolicyState extends State<PagePrivacypolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: Colors.white,
        appBar: AppBar(
           // backgroundColor: const Color.fromRGBO(62, 168, 228, 1),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            title: Text('Privacy policy'.tr)),
        body: Center(
          child: SizedBox(
         
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),

//TitlePage --------------- ^^^^^^^^^^^^^^^
                const TitlePages(
                  name: 'سياسة الخصوصية',
                  font: 'Cairo-Bold',
                ),
//TitlePage --------------- ^^^^^^^^^^^^^^^

   SizedBox(
       height: 350,
            width: 500,
   child: Padding(
   padding: const EdgeInsets.all(30),
   child: Image.asset('assets/img/policyimg.png',
   width: 250,)
   )
   ),
   for (var i = 0; i < dataabout.length; i++)   
                   if(dataabout[i]['Privacypolicy'] == '1')  
                Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(children:   [
                      AutoSizeText(dataabout[i]['title'],
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
                   ,const SizedBox(height: 20,)
                   
                    ])),
              ],
            ),
          ),
        ));
  }
}
