// ignore_for_file: file_names
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../Services/Functions/Variables.dart';
import '../../Services/API/Api.dart';

class FollowUS extends StatefulWidget {
const FollowUS({Key? key}) : super(key: key);
@override
_FollowUSState createState() => _FollowUSState();
}


class _FollowUSState extends State<FollowUS> {
@override
Widget build(BuildContext context) {
return Scaffold(
  //backgroundColor: Colors.white,
appBar: AppBar(
    //backgroundColor: const Color.fromRGBO(62, 168, 228, 1),
  title: Text('Binding Of Iraq'.tr)),
body:  
Padding(
  padding: const EdgeInsets.all(50.0),
  child:   ListView(
    children: [
      for (var i = 0; i < dataSupporters.length; i++)
  
  if(dataSupporters[i]['Followus'] == '1')
  
  Container(
  
  height: 400,
  
  decoration: BoxDecoration(boxShadow: [shadowDark],
  
  color: Theme.of(context).backgroundColor, 
  
  borderRadius:BorderRadius.circular(15),
  
  ),
  
  alignment: Alignment.center,
  
  
  
  child: Column(
  
  mainAxisAlignment:MainAxisAlignment.end,
  
  children: <Widget>[
  
  
  
  //CircleAvatar Photo Man --------------- ^^^^^^^^^^^^^^^
  
  CircleAvatar(
  
  radius: 45,
  
  child: ClipOval(
  
  child: CachedNetworkImage(
  
  imageUrl:dataSupporters[i]['img'],imageBuilder:(context, imageProvider) => Container(
  
  height: 180,decoration: BoxDecoration(
  
  image: DecorationImage(
  
  image: imageProvider,
  
  ),
  
  ),
  
  ),
  
  placeholder: (context, url) =>const CircularProgressIndicator(),
  
  errorWidget: (context, url, error) =>const Icon(Icons.error),),
  
  ),),
  
  //space --------------- ^^^^^^^^^^^^^^^
  
  const SizedBox(height: 5),
  
  //name --------------- ^^^^^^^^^^^^^^^
  
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: AutoSizeText(dataSupporters[i]['name'],
  
  style: const TextStyle(fontFamily: 'Cairo-Bold'),
  minFontSize: 13,
  maxFontSize: 15,
),
   ),
  
  //info --------------- ^^^^^^^^^^^^^^^
  
   Expanded(
  
   child: Padding(
     padding: const EdgeInsets.all(8.0),
     child: AutoSizeText(dataSupporters[i]['description'],
  
     minFontSize: 13,
  
     maxFontSize: 15,
  
 
  
     textAlign: TextAlign.center,
     ),
   )),
  
  //space --------------- ^^^^^^^^^^^^^^^
  
  const SizedBox(height: 10),
  
  const Divider(),
  
  SizedBox(child:  Row(
  
  mainAxisAlignment:MainAxisAlignment.center,
  
  children: [
  
  IconButton(icon: Image.asset('assets/img/facebook.png'),onPressed: () {}),
  
  IconButton(icon: Image.asset('assets/img/twitter.png'),onPressed: () {}),
  
  IconButton(icon: Image.asset('assets/img/instagram.png'),onPressed: () {})
  
  
  
  ],
  
  ),)
  
   
  
  ]))
  
    ],
  
  ),
)
 
     );
  }
}
