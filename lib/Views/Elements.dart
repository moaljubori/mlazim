// ignore_for_file: file_names, deprecated_member_use, non_constant_identifier_names, duplicate_ignore
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/API/Api.dart';
import '../Services/Functions/Variables.dart';
import '../Services/Thems/Theme.dart';
import 'Content/Classroom_Content/ViewVideo.dart';
import 'Content/Classroom_Content/View_PDF.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//Class  ------- Title Page -------- ^^^^^^^^^^^^^^^
class TitlePages extends StatefulWidget {
  @override
  _TitlePagesState createState() => _TitlePagesState();
  final String name;
  final String font;
  const TitlePages({
    Key? key,
    required this.name,
    required this.font,
  }) : super(key: key);
}

class _TitlePagesState extends State<TitlePages> {
  // ignore: non_constant_identifier_names
  late String BuildName = widget.name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: LangSet
          ? const EdgeInsets.only(right: 15)
          : const EdgeInsets.only(left: 15),
      height: 40,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            child: SizedBox(
              child: Image.asset('assets/img/i.png'),
            ),
          ),
          Container(
            padding: LangSet
                ? const EdgeInsets.only(right: 15)
                : const EdgeInsets.only(left: 20),
            child: Text(
              BuildName,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: widget.font,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
//Class  ------- Title Page -------- ^^^^^^^^^^^^^^^

//Class  ------- Title Supporters -------- ^^^^^^^^^^^^^^^
class TitleSupporters extends StatefulWidget {
  @override
  _TitleSupportersState createState() => _TitleSupportersState();
  final String name;
  final String color;
  const TitleSupporters({
    Key? key,
    required this.name,
    required this.color,
  }) : super(key: key);
}

class _TitleSupportersState extends State<TitleSupporters> {
  final Y = const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromRGBO(244, 166, 64, 1),
          Color.fromRGBO(244, 166, 64, 1)
        ]),
  );

  final R = const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromRGBO(122, 191, 249, 1),
          Color.fromRGBO(61, 147, 221, 1)
        ]),
  );

  final B = const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromRGBO(201, 201, 201, 1),
          Color.fromRGBO(136, 132, 133, 1)
        ]),
  );

  final RE = const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromRGBO(255, 91, 126, 1),
          Color.fromRGBO(224, 50, 104, 1)
        ]),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: widget.color == 'Y'
          ? Y
          : widget.color == 'R'
              ? R
              : widget.color == 'B'
                  ? B
                  : RE,
      child: Text(widget.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontFamily: 'Cairo-Bold', color: Colors.white, fontSize: 20)),
    );
  }
}
//Class  ------- Title Supporters -------- ^^^^^^^^^^^^^^^

//Class -------------- Loding Data ------------ ^^^^^^^^^^^
final loadingDataClass = Center(
    child: Column(
  children: [
    const CircularProgressIndicator(),
    Text("Wait while downloading data...".tr)
  ],
));
//Class -------------- Loding Data ------------ ^^^^^^^^^^^

//Class  ------- BookCard  -------- ^^^^^^^^^^^^^^^
class BookCard extends StatefulWidget {
  @override
  _BookCard createState() => _BookCard();
  final String name;
  final String views;
  final String color;
  final String img;
  final String pdf;
  final String id;
  final String Type;
  final bool fav;
  const BookCard({
    Key? key,
    required this.name,
    required this.views,
    required this.color,
    required this.img,
    required this.pdf,
    required this.id,
    required this.Type,
    required this.fav,
  }) : super(key: key);
}

class _BookCard extends State<BookCard> {
  double _rating = 0.0;

  AlartRate(name, id, type, img) {
    showDialog(
        builder: (context) => CupertinoAlertDialog(
              title: Text(name),
              content: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.network(
                      img,
                      fit: BoxFit.fill,
                      width: 200,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 0.3),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            _rating = rating;
                          });
                        },
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          primary: color_system),
                      onPressed: () {
                        SetRate(id, type, _rating.toString());
                        Navigator.of(context).pop();
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('ارسال التقييم'.tr,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                )),
                            const Icon(Icons.arrow_forward_ios, size: 15)
                          ]),
                    )
                  ],
                ),
              ),
              actions: const <Widget>[],
            ),
        context: context);
  }

  // ignore: non_constant_identifier_names
  late String BuildName = widget.name;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 10.0)
      ]),
      child: SizedBox(
        child: Stack(children: [
          Positioned(
            child: Container(
                child: Column(children: [
                  Column(children: [
                    SizedBox(
                        height: 220,
                        child: Center(
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: ColorOther[int.parse(widget.color)],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: CachedNetworkImage(
                                imageUrl: widget.img,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: imageProvider,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            )),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: LangSet
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(177, 220, 244, 1),
                                borderRadius: BorderRadius.circular(7)),
                            margin: LangSet
                                ? const EdgeInsets.only(right: 10)
                                : const EdgeInsets.only(left: 10),
                            padding: LangSet
                                ? const EdgeInsets.only(right: 7)
                                : const EdgeInsets.only(left: 7),
                            width: 85,
                            child: Row(children: [
                              Expanded(
                                  child: Text(
                                widget.views,
                                style: const TextStyle(color: Colors.black),
                              )),
                              const Expanded(
                                  child: Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ))
                            ]))),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AutoSizeText(
                        widget.name,
                        minFontSize: 13,
                        maxFontSize: 15,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(thickness: 1),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  primary: color_system),
                              onPressed: () {
                                Get.to(PdfViewr(
                                  name: widget.name,
                                  PDF: widget.pdf,
                                ));
                              },
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Read'.tr,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                        )),
                                    const Icon(Icons.arrow_forward_ios,
                                        size: 15)
                                  ]),
                            )),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  primary: color_system),
                              onPressed: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                if (prefs.getString('StateUserLogin') == '1') {
                                  AlartRate(widget.name, widget.id, widget.Type,
                                      widget.img);
                                } else {
                                  showDialog(
                                      builder: (context) =>
                                          CupertinoAlertDialog(
                                            title: Column(
                                              children: <Widget>[
                                                Text("Oops!".tr),
                                                const Icon(
                                                  Icons.login,
                                                  color: Colors.red,
                                                ),
                                              ],
                                            ),
                                            content: Text(
                                                "You_are_not_registered".tr),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("close".tr))
                                            ],
                                          ),
                                      context: context);
                                }
                              },
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Rate'.tr,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                        )),
                                    const Icon(Icons.arrow_forward_ios,
                                        size: 15)
                                  ]),
                            )),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ])
                ]),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                )),
          ),
          Positioned(
              left: 15,
              top: 18,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2), blurRadius: 30.0)
                  ],
                  color: Colors.white,
                ),
                width: 45,
                height: 45,
                child: FavoriteButton(
                  iconSize: 30,
                  isFavorite: widget.fav,
// ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                  valueChanged: (Value) async {
                    final prefs = await SharedPreferences.getInstance();
//if fav
                    if (Value == false) {
                      if (prefs.getString('StateUserLogin') == '1') {
                        RemoveFav(widget.id, '1');

                        showDialog(
                            builder: (context) => CupertinoAlertDialog(
                                  title: Column(
                                    children: <Widget>[
                                      Text("fav".tr),
                                      const Icon(
                                        Icons.favorite,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  content: Text("removed from favourites".tr),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("close".tr))
                                  ],
                                ),
                            context: context);
                      }
                    } else {
                      if (prefs.getString('StateUserLogin') == '1') {
                        SetFav(widget.id, '1');

//add
                        showDialog(
                            builder: (context) => CupertinoAlertDialog(
                                  title: Column(
                                    children: <Widget>[
                                      Text("fav".tr),
                                      const Icon(
                                        Icons.favorite,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                  content: Text("favAdd".tr),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("close".tr))
                                  ],
                                ),
                            context: context);
                      } else {
                        showDialog(
                            builder: (context) => CupertinoAlertDialog(
                                  title: Column(
                                    children: <Widget>[
                                      Text("Oops!".tr),
                                      const Icon(
                                        Icons.login,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                  content: Text("You_are_not_registered".tr),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("close".tr))
                                  ],
                                ),
                            context: context);
                      }
                    }
                  },
                ),
              )),
        ]),
      ),
    );
  }
}
//Class  ------- BookCard -------- ^^^^^^^^^^^^^^^

//Class  ------- VideoCard  -------- ^^^^^^^^^^^^^^^
class VideoCard extends StatefulWidget {
  @override
  _VideoCard createState() => _VideoCard();
  final String name;
  final String id;
  final String views;
  final String color;
  final String img;
  final String Link;
  final bool fav;
  const VideoCard({
    Key? key,
    required this.name,
    required this.views,
    required this.color,
    required this.img,
    required this.Link,
    required this.id,
    required this.fav,
  }) : super(key: key);
}

class _VideoCard extends State<VideoCard> {
  // ignore: non_constant_identifier_names
  late String BuildName = widget.name;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 10.0)
      ]),
      child: SizedBox(
        child: Stack(children: [
          Positioned(
            child: Container(
                child: Column(children: [
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(top: 240),
                          child: Column(children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            177, 220, 244, 1),
                                        borderRadius: BorderRadius.circular(7)),
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.only(right: 7),
                                    width: 85,
                                    child: Row(children: [
                                      Expanded(
                                          child: Text(
                                        widget.views,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      )),
                                      const Expanded(
                                          child: Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ))
                                    ]))),
                            AutoSizeText(widget.name,
                                minFontSize: 13,
                                maxFontSize: 15,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.fade),
                            const Divider(thickness: 1),
                            SizedBox(
                              height: 40,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            primary: color_system),
                                        onPressed: () {
                                          Get.to(YoutubePlayerd(
                                            name: widget.name,
                                            link: widget.Link,
                                          ));
                                        },
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text('Watch'.tr,
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  )),
                                              const Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 15)
                                            ]),
                                      )),
                                    ]),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ])))
                ]),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                )),
          ),
          Positioned(
            top: 8,
            left: 5,
            right: 5,
            child: SizedBox(
                height: 220,
                child: Center(
                  child: Container(
                    width: 200,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorOther[int.parse(widget.color)],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: CachedNetworkImage(
                        imageUrl: widget.img,
                        imageBuilder: (context, imageProvider) => Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: imageProvider,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )),
                  ),
                )),
          ),
          Positioned(
              left: 25,
              top: 18,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2), blurRadius: 30.0)
                  ],
                  color: Colors.white,
                ),
                width: 45,
                height: 45,
                child: FavoriteButton(
                  iconSize: 30,
                  isFavorite: widget.fav,
// ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                  valueChanged: (Value) async {
                    final prefs = await SharedPreferences.getInstance();
                    //if fav
                    if (Value == false) {
                      if (prefs.getString('StateUserLogin') == '1') {
                        RemoveFav(widget.id, '1');

                        showDialog(
                            builder: (context) => CupertinoAlertDialog(
                                  title: Column(
                                    children: <Widget>[
                                      Text("fav".tr),
                                      const Icon(
                                        Icons.favorite,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  content: Text("تم الازالة من المفضلات".tr),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("close".tr))
                                  ],
                                ),
                            context: context);
                      }
                    } else {
                      if (prefs.getString('StateUserLogin') == '1') {
                        SetFav(widget.id, '1');

//add
                        showDialog(
                            builder: (context) => CupertinoAlertDialog(
                                  title: Column(
                                    children: <Widget>[
                                      Text("fav".tr),
                                      const Icon(
                                        Icons.favorite,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                  content: Text("favAdd".tr),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("close".tr))
                                  ],
                                ),
                            context: context);
                      } else {
                        showDialog(
                            builder: (context) => CupertinoAlertDialog(
                                  title: Column(
                                    children: <Widget>[
                                      Text("Oops!".tr),
                                      const Icon(
                                        Icons.login,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                  content: Text("You_are_not_registered".tr),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("close".tr))
                                  ],
                                ),
                            context: context);
                      }
                    }
                  },
                ),
              )),
        ]),
      ),
    );
  }
}
//Class  ------- VideoCard  -------- ^^^^^^^^^^^^^^^
