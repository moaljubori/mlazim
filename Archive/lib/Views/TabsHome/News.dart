// ignore_for_file: file_names, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Services/API/Api.dart';
import '../../Services/Functions/StateMangament.dart';
import '../../admob/AdmobMohmmad.dart';
import '../Elements.dart';
import '../../../Services/Functions/Variables.dart';

//Class  --------------- ^^^^^^^^^^^^^^^
class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);
  @override
  _NewsState createState() => _NewsState();
}
//Class  --------------- ^^^^^^^^^^^^^^^

//UI Class  --------------- ^^^^^^^^^^^^^^^
class _NewsState extends State<News> {

@override
  void initState() {
    SetState_HomePage(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//Content --------------- ^^^^^^^^^^^^^^^
    return ListView(
      children: [

       const SizedBox(height: 15),
FutureBuilder(
future: ADS_BANNER_MOHMMAD(),
builder: (BuildContext ctx, AsyncSnapshot snapshot) {
if (snapshot.data == null) { return const SizedBox(height: 130,); } 
else {
return Container(
padding: const EdgeInsets.only(left: 15 , right: 15),
child:  RturenAdmobMohmmad(snapshot.data) 
);}}),
 

 
//TitlePage --------------- ^^^^^^^^^^^^^^^
          Center(
          child: TitlePages(
            name: "latest news".tr,
            font: 'Cairo-Bold',
          ),
        ),

//TitlePage --------------- ^^^^^^^^^^^^^^^

//space --------------- ^^^^^^^^^^^^^^^
        const SizedBox(height: 10),
//space --------------- ^^^^^^^^^^^^^^^

        Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
//Row Data --------------- ^^^^^^^^^^^^^^^
                if (newsDataServer.isEmpty)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  for (var i = 0; i < newsDataServer.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: GestureDetector(
                        onTap: () => {launch(newsDataServer[i]['link'])},

//Container gradient --------------- ^^^^^^^^^^^^^^^
                        child: Container(
                          alignment: LangSet? Alignment.centerLeft : Alignment.centerRight ,
                          decoration: BoxDecoration(
                            boxShadow: [shadowDark],
                            gradient: list[i],
                            borderRadius: BorderRadius.circular(10),
                          ),

//Container content --------------- ^^^^^^^^^^^^^^^
                          child: Container(
                            margin: LangSet? const EdgeInsets.only(right: 17) : const EdgeInsets.only(left: 17),
                            padding: LangSet? const EdgeInsets.only(left: 13, bottom: 5) : const EdgeInsets.only(right: 13, bottom: 5),
                            decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius:LangSet?   const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)): 
                                     const BorderRadius.only(
                                  topRight:Radius.circular(10),
                                  bottomRight: Radius.circular(10)),


                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                    title: Text(
                                      newsDataServer[i]['newstitle'].toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Cairo-Bold'),
                                    ),
                                    subtitle: Text(
                                      newsDataServer[i]['newsdescription']
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Cairo-Regular'),
                                    )),
                                Align(
                                  child: Text(
                                    newsDataServer[i]['date'],
                              
                                  ),
                                  alignment: LangSet? Alignment.centerLeft:Alignment.centerRight ,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
              ],
            )),

//space --------------- ^^^^^^^^^^^^^^^
        const SizedBox(height: 20),
//space --------------- ^^^^^^^^^^^^^^^
      ],
    );
  }
}
