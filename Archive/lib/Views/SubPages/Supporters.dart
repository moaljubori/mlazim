// ignore_for_file: file_names, deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Services/API/Api.dart';
import '../../Services/Functions/Response.dart';
import '../Elements.dart';
import '../../../Services/Functions/Variables.dart';

class PageSupporters extends StatefulWidget {
  const PageSupporters({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<PageSupporters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
         // backgroundColor: const Color.fromRGBO(62, 168, 228, 1),
          title: Text('Supporters'.tr),
        ),
        body: ListView(
          children: [
//Space --------------- ^^^^^^^^^^^^^^^
            const SizedBox(
              height: 10,
            ),
//Space --------------- ^^^^^^^^^^^^^^^

//############################ Golden Section ##########################





//TitleSupporters --------------- ^^^^^^^^^^^^^^^
            TitleSupporters(
              name: 'Golden Section'.tr,
              color: 'Y',
            ),
//TitleSupporters --------------- ^^^^^^^^^^^^^^^

//DataViews --------------- ^^^^^^^^^^^^^^^
 GridView.count(
 padding: const EdgeInsets.all(15),
 crossAxisCount: GetNumberViewGridBook(MediaQuery.of(context).size.width)[0],
 mainAxisSpacing: 15,
 crossAxisSpacing: 10,
 childAspectRatio: GetNumberViewGridBook(MediaQuery.of(context).size.width)[1],
 controller: ScrollController(keepScrollOffset: true),
 shrinkWrap: true,
 scrollDirection: Axis.vertical,
 children: [



for (var i = 0; i < dataSupporters.length; i++)
if(dataSupporters[i]['qussam'] == '1')
//Row Data --------------- ^^^^^^^^^^^^^^^
Container(
decoration: BoxDecoration(
boxShadow: [shadowDark],
color: Theme.of(context).backgroundColor,
borderRadius: BorderRadius.circular(15),
),
alignment: Alignment.center,
child: Column(
mainAxisAlignment: MainAxisAlignment.end,
children: <Widget>[
//CircleAvatar Photo Man --------------- ^^^^^^^^^^^^^^^
Container(
padding: const EdgeInsets.all(10),
decoration: const BoxDecoration(
gradient: LinearGradient(
begin: Alignment.centerLeft,
end: Alignment.centerRight,
colors: [Color.fromRGBO(244, 166, 64, 1),Color.fromRGBO(244, 166, 64, 1)]),
shape: BoxShape.circle),
child: CircleAvatar(
radius: 45,
child: ClipOval(
child: CachedNetworkImage(
imageUrl:dataSupporters[i]['img'],
imageBuilder: (context, imageProvider) =>
Container(
height: 180,
decoration: BoxDecoration(
image: DecorationImage(image: imageProvider,),
),
),
placeholder: (context, url) =>const CircularProgressIndicator(),
errorWidget: (context, url, error) =>const Icon(Icons.error),
),
),
),
),

//space --------------- ^^^^^^^^^^^^^^^
const SizedBox(height: 5),
//name --------------- ^^^^^^^^^^^^^^^
 AutoSizeText(dataSupporters[i]['name'],
style: const TextStyle(fontFamily: 'Cairo-Bold'),
minFontSize: 13,
maxFontSize: 15,
maxLines: 1,
overflow: TextOverflow.ellipsis),
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
 SizedBox(
 child: Row(
 mainAxisAlignment: MainAxisAlignment.center,
 children: [
 IconButton(
 icon: Image.asset('assets/img/facebook.png'),
onPressed: () {
  launch(newsDataServer[i]['facebook']);
}),
IconButton(
icon:Image.asset('assets/img/twitter.png'),
onPressed: () {
    launch(newsDataServer[i]['twitter']);
}),
IconButton(
icon: Image.asset('assets/img/instagram.png'),
onPressed: () {
  launch(newsDataServer[i]['instgram']);
})
],
),
)
]))
]),
//DataViews --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
            const SizedBox(
              height: 10,
            ),
//Space --------------- ^^^^^^^^^^^^^^^








//############################ Diamond Section ##########################

//TitleSupporters --------------- ^^^^^^^^^^^^^^^
TitleSupporters(
name: 'Diamond Section'.tr,
color: 'R',
),
//TitleSupporters --------------- ^^^^^^^^^^^^^^^

//DataViews --------------- ^^^^^^^^^^^^^^^
 GridView.count(
 padding: const EdgeInsets.all(15),
 crossAxisCount: GetNumberViewGridBook(MediaQuery.of(context).size.width)[0],
 mainAxisSpacing: 15,
 crossAxisSpacing: 10,
 childAspectRatio: GetNumberViewGridBook(MediaQuery.of(context).size.width)[1],
 controller: ScrollController(keepScrollOffset: true),
 shrinkWrap: true,
 scrollDirection: Axis.vertical,
 children: [



for (var i = 0; i < dataSupporters.length; i++)
if(dataSupporters[i]['qussam'] == '2')
//Row Data --------------- ^^^^^^^^^^^^^^^
Container(
decoration: BoxDecoration(
boxShadow: [shadowDark],
color: Theme.of(context).backgroundColor,
borderRadius: BorderRadius.circular(15),
),
alignment: Alignment.center,
child: Column(
mainAxisAlignment: MainAxisAlignment.end,
children: <Widget>[
//CircleAvatar Photo Man --------------- ^^^^^^^^^^^^^^^
Container(
padding: const EdgeInsets.all(10),
decoration: const BoxDecoration(
gradient: LinearGradient(
begin: Alignment.centerLeft,
end: Alignment.centerRight,
colors: [
Color.fromRGBO(122, 191, 249, 1),
Color.fromRGBO(61, 147, 221, 1)
]),
shape: BoxShape.circle),
child: CircleAvatar(
radius: 45,
child: ClipOval(
child: CachedNetworkImage(
imageUrl:dataSupporters[i]['img'],
imageBuilder: (context, imageProvider) =>
Container(
height: 180,
decoration: BoxDecoration(
image: DecorationImage(
image: imageProvider,
),
),
),
placeholder: (context, url) =>
const CircularProgressIndicator(),
errorWidget: (context, url, error) =>
const Icon(Icons.error),
),
),
),
),

//space --------------- ^^^^^^^^^^^^^^^
 const SizedBox(height: 5),
//name --------------- ^^^^^^^^^^^^^^^
 AutoSizeText(dataSupporters[i]['name'],
style: const TextStyle(fontFamily: 'Cairo-Bold'),
minFontSize: 13,
maxFontSize: 15,
maxLines: 1,
overflow: TextOverflow.ellipsis),
//info --------------- ^^^^^^^^^^^^^^^
  Expanded(
child: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   AutoSizeText(dataSupporters[i]['description'],
   minFontSize: 13,
   maxFontSize: 15,
   textAlign: TextAlign.center,
 ),
)),
//space --------------- ^^^^^^^^^^^^^^^
const SizedBox(height: 10),
const Divider(),
SizedBox(
child: Row(
 mainAxisAlignment: MainAxisAlignment.center,
 children: [
 IconButton(
 icon: Image.asset('assets/img/facebook.png'),
onPressed: () {
  launch(newsDataServer[i]['facebook']);
}),
IconButton(
icon:Image.asset('assets/img/twitter.png'),
onPressed: () {
    launch(newsDataServer[i]['twitter']);
}),
IconButton(
icon: Image.asset('assets/img/instagram.png'),
onPressed: () {
  launch(newsDataServer[i]['instgram']);
})
],
),
)
                          ]))
                ]),
//DataViews --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
            const SizedBox(
              height: 10,
            ),
//Space --------------- ^^^^^^^^^^^^^^^






//############################ Silver Section ##########################

//TitleSupporters --------------- ^^^^^^^^^^^^^^^
            TitleSupporters(
              name: 'Silver Section'.tr,
              color: 'B',
            ),
//TitleSupporters --------------- ^^^^^^^^^^^^^^^



//DataViews --------------- ^^^^^^^^^^^^^^^
 GridView.count(
 padding: const EdgeInsets.all(15),
 crossAxisCount: GetNumberViewGridBook(MediaQuery.of(context).size.width)[0],
 mainAxisSpacing: 15,
 crossAxisSpacing: 10,
 childAspectRatio: GetNumberViewGridBook(MediaQuery.of(context).size.width)[1],
 controller: ScrollController(keepScrollOffset: true),
 shrinkWrap: true,
 scrollDirection: Axis.vertical,
 children: [



for (var i = 0; i < dataSupporters.length; i++)
if(dataSupporters[i]['qussam'] == '3')
//Row Data --------------- ^^^^^^^^^^^^^^^
Container(
decoration: BoxDecoration(
boxShadow: [shadowDark],
color: Theme.of(context).backgroundColor,
borderRadius: BorderRadius.circular(15),
),
alignment: Alignment.center,
child: Column(
mainAxisAlignment: MainAxisAlignment.end,
children: <Widget>[
//CircleAvatar Photo Man --------------- ^^^^^^^^^^^^^^^
CircleAvatar(
  radius: 45,
  child: ClipOval(
    child: CachedNetworkImage(
      imageUrl:dataSupporters[i]['img'],
      imageBuilder: (context, imageProvider) =>
          Container(
        height: 180,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
          ),
        ),
      ),
      placeholder: (context, url) =>
          const CircularProgressIndicator(),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error),
    ),
  ),
),
//space --------------- ^^^^^^^^^^^^^^^
const SizedBox(height: 5),
//name --------------- ^^^^^^^^^^^^^^^
 AutoSizeText(dataSupporters[i]['name'],
style: const TextStyle(fontFamily: 'Cairo-Bold'),
minFontSize: 13,
maxFontSize: 15,
maxLines: 1,
overflow: TextOverflow.ellipsis),
//info --------------- ^^^^^^^^^^^^^^^
  Expanded(
child: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   AutoSizeText(dataSupporters[i]['description'],
  
   minFontSize: 13,
  
   maxFontSize: 15,
  
   
  
   textAlign: TextAlign.center,
  
   ),
)),
//space --------------- ^^^^^^^^^^^^^^^
 const SizedBox(height: 10),
 const Divider(),
 SizedBox(
child: Row(
 mainAxisAlignment: MainAxisAlignment.center,
 children: [
 IconButton(
 icon: Image.asset('assets/img/facebook.png'),
onPressed: () {
  launch(newsDataServer[i]['facebook']);
}),
IconButton(
icon:Image.asset('assets/img/twitter.png'),
onPressed: () {
    launch(newsDataServer[i]['twitter']);
}),
IconButton(
icon: Image.asset('assets/img/instagram.png'),
onPressed: () {
  launch(newsDataServer[i]['instgram']);
})
],
),
)
                          ]))
                ]),
//DataViews --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
            const SizedBox(
              height: 10,
            ),
//Space --------------- ^^^^^^^^^^^^^^^





//############################ Normal Section ##########################

//TitleSupporters --------------- ^^^^^^^^^^^^^^^
            TitleSupporters(
              name: 'Silver Section'.tr,
              color: 'RE',
            ),
//TitleSupporters --------------- ^^^^^^^^^^^^^^^

//DataViews --------------- ^^^^^^^^^^^^^^^
 GridView.count(
 padding: const EdgeInsets.all(15),
 crossAxisCount: GetNumberViewGridBook(MediaQuery.of(context).size.width)[0],
 mainAxisSpacing: 15,
 crossAxisSpacing: 10,
 childAspectRatio: GetNumberViewGridBook(MediaQuery.of(context).size.width)[1],
 controller: ScrollController(keepScrollOffset: true),
 shrinkWrap: true,
 scrollDirection: Axis.vertical,
 children: [



for (var i = 0; i < dataSupporters.length; i++)
if(dataSupporters[i]['qussam'] == '4')
Container(
decoration: BoxDecoration(
boxShadow: [shadowDark],
color: Theme.of(context).backgroundColor,
borderRadius: BorderRadius.circular(15),
),
alignment: Alignment.center,
child: Column(
mainAxisAlignment: MainAxisAlignment.end,
children: <Widget>[
//CircleAvatar Photo Man --------------- ^^^^^^^^^^^^^^^
CircleAvatar(
radius: 45,
child: ClipOval(
child: CachedNetworkImage(
imageUrl:dataSupporters[i]['img'],
imageBuilder: (context, imageProvider) =>
Container(
height: 180,
decoration: BoxDecoration(image: DecorationImage(image: imageProvider,),
),
),
placeholder: (context, url) =>const CircularProgressIndicator(),
errorWidget: (context, url, error) =>const Icon(Icons.error),
    ),
  ),
),
//space --------------- ^^^^^^^^^^^^^^^
const SizedBox(height: 5),
//name --------------- ^^^^^^^^^^^^^^^
 AutoSizeText(dataSupporters[i]['name'],
    style: const TextStyle(fontFamily: 'Cairo-Bold'),
    minFontSize: 13,
    maxFontSize: 15,
    maxLines: 1,
    overflow: TextOverflow.ellipsis),
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
SizedBox(
child: Row(
 mainAxisAlignment: MainAxisAlignment.center,
 children: [
 IconButton(
 icon: Image.asset('assets/img/facebook.png'),
onPressed: () {
  launch(newsDataServer[i]['facebook']);
}),
IconButton(
icon:Image.asset('assets/img/twitter.png'),
onPressed: () {
    launch(newsDataServer[i]['twitter']);
}),
IconButton(
icon: Image.asset('assets/img/instagram.png'),
onPressed: () {
  launch(newsDataServer[i]['instgram']);
})
],
),
)
                          ]))
                ]),
//DataViews --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
            const SizedBox(
              height: 10,
            ),
//Space --------------- ^^^^^^^^^^^^^^^
          ],
        ));
  }
}
