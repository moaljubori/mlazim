// ignore_for_file: deprecated_member_use, non_constant_identifier_names, file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

RturenAdmobMohmmad(data){
  return 
  Column(
children: [
  CarouselSlider(
options: CarouselOptions(height: 130.0 , 
autoPlay: true , 
enableInfiniteScroll: true,
initialPage: 0,
autoPlayCurve: Curves.ease,
disableCenter: true,
viewportFraction: 1,
enlargeCenterPage: true,
autoPlayInterval: const Duration(seconds: 4), ),
items: List.generate(data.length, (index) {
return Builder(builder: (BuildContext context) {
return GestureDetector(onTap: () => {launch(data[index].link.toString())},
//------------
child:
Container(
decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
image: DecorationImage(
image: NetworkImage(data[index].img ),
fit: BoxFit.cover,
),
), 
width: MediaQuery.of(context).size.width ,
margin: const EdgeInsets.symmetric(horizontal: 5.0),
));
},
);
})
),
Row(
mainAxisAlignment: MainAxisAlignment.center,
 children:  List.generate(data.length, (index) {
 return Container(
 width: 7.0,
 height: 7.0,
 margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
 decoration: const BoxDecoration(
 shape: BoxShape.circle,
color: Colors.white,
),
);
}),
),
],);
  
 
}