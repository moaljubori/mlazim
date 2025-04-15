// ignore_for_file: non_constant_identifier_names
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malazim_iq/Views/SubPages/FollowUS.dart';
import '../../Services/Thems/Icons.dart';
import '../Services/Functions/StateMangament.dart';
import '../Services/Functions/Variables.dart';
import 'SubPages/Serach.dart';
import 'SubPages/favourites.dart';
import 'TabsHome/Classroom.dart';
import 'TabsHome/Menus.dart';
import 'TabsHome/News.dart';
import 'TabsHome/Request.dart';
import 'TabsHome/Results.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController TabsHomePages = TabController(vsync: this, length: 5);
  late int indexMe = 0;

  @override
  void initState() {
    super.initState();
    SetState_HomePage = _update;
    // getThemeStatus();
    // loadCounter();
    // GetServerApi();
  }

  _update(index) {
    indexMe = index;
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
            // backgroundColor: const Color.fromRGBO(62, 168, 228, 1),
            centerTitle: true,
            actions: [
//favourites --------------- ^^^^^^^^^^^^^^^
              SizedBox(
                width: 40,
                child: TextButton(
                    onPressed: () => {Get.to(const favourites())},
                    child: MalazimIQ_favourites_icon),
              ),
//favourites --------------- ^^^^^^^^^^^^^^^

//followers --------------- ^^^^^^^^^^^^^^^
              SizedBox(
                width: 40,
                child: TextButton(
                    onPressed: () => {Get.to(const FollowUS())},
                    child: MalazimIQ_followers_icon),
              ),
//followers --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
              const SizedBox(width: 10),
//Space --------------- ^^^^^^^^^^^^^^^
            ],

//Title --------------- ^^^^^^^^^^^^^^^
            title: Text('Binding Of Iraq'.tr,
                style: const TextStyle(fontFamily: 'Cairo-Bold')),
//Title --------------- ^^^^^^^^^^^^^^^

            leading: Row(children: [
//PageSerach --------------- ^^^^^^^^^^^^^^^
              IconButton(
                  onPressed: () => {Get.to(const PageSerach())},
                  iconSize: 28,
                  icon: const Icon(Icons.search))
//PageSerach --------------- ^^^^^^^^^^^^^^^
            ])),

//bottomNavigationBar --------------- ^^^^^^^^^^^^^^^
        bottomNavigationBar: Material(
          color: isLightTheme.value
              ? Get.theme.backgroundColor
              : const Color.fromRGBO(1, 38, 63, 1),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          elevation: 20,
          shadowColor: Colors.black,

//TabBar --------------- ^^^^^^^^^^^^^^^
          child: TabBar(
              indicatorColor: const Color.fromARGB(255, 255, 255, 255),
              unselectedLabelColor:
                  Theme.of(context).textTheme.headline3!.color,
              labelStyle:
                  const TextStyle(fontSize: 12.0, fontFamily: 'Cairo-Regular'),
              unselectedLabelStyle:
                  const TextStyle(fontSize: 13.0, fontFamily: 'Cairo-Regular'),
              controller: TabsHomePages,
              indicatorWeight: 3,
              onTap: (index) {
                setState(() {
                  indexMe = index;
                });
              },
              dragStartBehavior: DragStartBehavior.start,
//tabs --------------- ^^^^^^^^^^^^^^^
              tabs: <Tab>[
//Tab Classroom --------------- ^^^^^^^^^^^^^^^
                Tab(
                    iconMargin: const EdgeInsets.only(bottom: 0.0),
                    icon: Stack(
                      children: [
                        if (indexMe == 0)
                          SizedBox(
                            child: isLightTheme.value
                                ? MalazimIQ_Classroom_icon
                                : MalazimIQ_Classroom_icon_White,
                            width: 32,
                            height: 30,
                          )
                        else
                          SizedBox(
                            child: isLightTheme.value
                                ? MalazimIQ_Classroom_icon
                                : MalazimIQ_Classroom_icon_White,
                            width: 32,
                            height: 30,
                          ),
                        Positioned(
                            right: 3,
                            top: 15,
                            child:
                                StatefulBuilder(builder: (context, setState) {
                              return Row(
                                children: [
                                  if (indexMe == 0)
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(146, 0, 68, 253),
                                      ),
                                      width: 15,
                                      height: 15,
                                    ),
                                ],
                              );
                            })),
                      ],
                    ),
                    text: 'Classes'.tr),
//Tab Classroom --------------- ^^^^^^^^^^^^^^^

//Tab News --------------- ^^^^^^^^^^^^^^^
                Tab(
                    iconMargin: const EdgeInsets.only(bottom: 0.0),
                    icon: Stack(
                      children: [
                        if (indexMe == 0)
                          SizedBox(
                            child: isLightTheme.value
                                ? MalazimIQ_News_icon
                                : MalazimIQ_News_icon_White,
                            width: 24,
                            height: 30,
                          )
                        else
                          SizedBox(
                            child: isLightTheme.value
                                ? MalazimIQ_News_icon
                                : MalazimIQ_News_icon_White,
                            width: 24,
                            height: 30,
                          ),
                        Positioned(
                            right: 0,
                            top: 15,
                            child:
                                StatefulBuilder(builder: (context, setState) {
                              return Row(
                                children: [
                                  if (TabsHomePages.index == 1)
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(146, 0, 68, 253),
                                      ),
                                      width: 15,
                                      height: 15,
                                    ),
                                ],
                              );
                            })),
                      ],
                    ),
                    text: 'News'.tr),
//Tab News --------------- ^^^^^^^^^^^^^^^

//Tab Add --------------- ^^^^^^^^^^^^^^^
                const Tab(icon: Icon(Icons.add, size: 30), text: ''),
//Tab Add --------------- ^^^^^^^^^^^^^^^

//Tab Results --------------- ^^^^^^^^^^^^^^^
                Tab(
                    iconMargin: const EdgeInsets.only(bottom: 0.0),
                    icon: Stack(
                      children: [
                        SizedBox(
                          child: isLightTheme.value
                              ? MalazimIQ_Results_icon
                              : MalazimIQ_Results_icon_White,
                          width: 22,
                          height: 30,
                        ),
                        Positioned(
                            right: 0,
                            top: 15,
                            child:
                                StatefulBuilder(builder: (context, setState) {
                              return Row(
                                children: [
                                  if (indexMe == 3)
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(146, 0, 68, 253),
                                      ),
                                      width: 15,
                                      height: 15,
                                    ),
                                ],
                              );
                            })),
                      ],
                    ),
                    text: 'Results'.tr),
//Tab News --------------- ^^^^^^^^^^^^^^^

//Tab More --------------- ^^^^^^^^^^^^^^^
                Tab(
                    iconMargin: const EdgeInsets.only(bottom: 0.0),
                    icon: Stack(
                      children: [
                        SizedBox(
                          child: isLightTheme.value
                              ? MalazimIQ_Menus_icon
                              : MalazimIQ_Menus_icon_White,
                          width: 22,
                          height: 30,
                        ),
                        Positioned(
                            right: 0,
                            top: 15,
                            child:
                                StatefulBuilder(builder: (context, setState) {
                              return Row(
                                children: [
                                  if (indexMe == 4)
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(146, 0, 68, 253),
                                      ),
                                      width: 15,
                                      height: 15,
                                    ),
                                ],
                              );
                            })),
                      ],
                    ),
                    text: 'More'.tr),
//Tab More --------------- ^^^^^^^^^^^^^^^
              ]),
        ),
        body: TabBarView(controller: TabsHomePages, children: const <Widget>[
          Classroom(),
          News(),
          Request(),
          Results(),
          Menus(),
        ]),
        floatingActionButton: Visibility(
            visible: !keyboardIsOpen,
            child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: IconButton(
                    iconSize: 110,
                    padding: const EdgeInsets.all(0),
                    icon: isLightTheme.value
                        ? MalazimIQ_Request_icon
                        : MalazimIQ_RequestDark_icon,
                    onPressed: () {
                      setState(() {
                        TabsHomePages.animateTo((TabsHomePages.index = 2) % 3);
                      });
                    }))),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}
