// ignore_for_file: file_names, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../../Services/API/Api.dart';
import '../../Services/Functions/Response.dart';
import '../../Services/Functions/StateMangament.dart';
import '../../admob/AdmobIos.dart';
import '../Elements.dart';

class favourites extends StatefulWidget {
  const favourites({Key? key}) : super(key: key);

  @override
  _favouritesState createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  var TabButtonSelect = [false, true, false];
  late bool _isLoding = true;
  late bool _bookType = true;
  late bool _videoType = false;
  bool _OnSearch = true;
  String valueserach = '';
  int _countData = 0;

  //----- LoadMoreData
  List<int> verticalData = [];
  bool isLoadingVertical = false;
  bool timerloding = false;
  //lIST dATA
  late int CountData;
  bool loaded = false;
//----- LoadMoreData

  _Update(length) {
    setState(() {
      verticalData.clear();
      isLoadingVertical = false;
      timerloding = false;
      _countData = length;
      _OnSearch = false;
      _isLoding = false;
    });
    _loadMoreVertical();
  }

  Future _loadMoreVertical() async {
    //تشغيل العداد
    setState(() {
      isLoadingVertical = true;
    });

// Add in an artificial delay
    await Future.delayed(const Duration(seconds: 0));
    CountData = _countData;

    var S = _countData;
    var L = verticalData.length;
    var R = S - L;
    // اذا كانت البيانات الجاية اكبر من المعروضة واكبر من خمسين
    if (S > L && S > 5) {
      if (R > 5) {
        verticalData.addAll(List.generate(5, (index) => L + index));
      } else {
        verticalData.addAll(List.generate(R, (index) => L + index));
      }
    }

    // اذا كانت البيانات المعروضة اقل من الجاية والجاية اقل من خمسين
    if (S > L && S < 5) {
      verticalData.addAll(List.generate(S, (index) => L + index));
    }

    // التحقق اذا كانت البيانات اصغر من 50
    if (S == 5) {
      verticalData.addAll(List.generate(S, (index) => L + index));
    }

    setState(() {
      isLoadingVertical = false;
      timerloding = true;
    });
  }

  @override
  void initState() {
    favouritesSetState = _Update;
    super.initState();
    GetFav('books');
    //B9.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المفضلات'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(padding: const EdgeInsets.all(0.0), child: B9C),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                //Button Book ^^^^^^^^^^^^^^^^^^^^^^^^^^
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: TabButtonSelect[1] == true
                              ? const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                      Color.fromRGBO(62, 168, 228, 1),
                                      Color.fromRGBO(62, 168, 228, 1)
                                    ])
                              : const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                      Color.fromRGBO(209, 234, 248, 1),
                                      Color.fromRGBO(209, 234, 248, 1)
                                    ]),
                          borderRadius: BorderRadius.circular(10)),
                      height: 45,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              _isLoding = true;
                              TabButtonSelect = [false, true, false];
                              _bookType = true;
                              _isLoding = true;
                              _videoType = false;
                            });

                            GetFav('books');
                          },
                          child: Text(
                            'Book'.tr,
                            style: TextStyle(
                                color: TabButtonSelect[1] == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontFamily: 'Cairo-SemiBold'),
                          ))),
                ),
//Button Book ^^^^^^^^^^^^^^^^^^^^^^^^^^
                const SizedBox(
                  width: 7,
                ),

//Button Binding ^^^^^^^^^^^^^^^^^^^^^^^^^^
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: TabButtonSelect[0] == true
                              ? const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                      Color.fromRGBO(62, 168, 228, 1),
                                      Color.fromRGBO(62, 168, 228, 1)
                                    ])
                              : const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                      Color.fromRGBO(209, 234, 248, 1),
                                      Color.fromRGBO(209, 234, 248, 1)
                                    ]),
                          borderRadius: BorderRadius.circular(10)),
                      height: 45,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              _isLoding = true;

                              _bookType = false;
                              _videoType = false;
                              TabButtonSelect = [true, false, false];
                            });
                            // DataOfMalazim('1');
                            GetFav('malazim');
                          },
                          child: Text(
                            'Binding'.tr,
                            style: TextStyle(
                                color: TabButtonSelect[0] == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontFamily: 'Cairo-SemiBold'),
                          ))),
                ),
//Button Binding ^^^^^^^^^^^^^^^^^^^^^^^^^^

                const SizedBox(
                  width: 7,
                ),

//Button Video ^^^^^^^^^^^^^^^^^^^^^^^^^^
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: TabButtonSelect[2] == true
                              ? const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                      Color.fromRGBO(62, 168, 228, 1),
                                      Color.fromRGBO(62, 168, 228, 1)
                                    ])
                              : const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                      Color.fromRGBO(209, 234, 248, 1),
                                      Color.fromRGBO(209, 234, 248, 1)
                                    ]),
                          borderRadius: BorderRadius.circular(10)),
                      height: 45,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              TabButtonSelect = [false, false, true];
                              _bookType = false;
                              _isLoding = true;
                              _videoType = true;
                            });
                            GetFav('video');
                          },
                          child: Text(
                            'Video'.tr,
                            style: TextStyle(
                                color: TabButtonSelect[2] == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontFamily: 'Cairo-SemiBold'),
                          ))),
                ),
//Button Video ^^^^^^^^^^^^^^^^^^^^^^^^^^
              ],
            ),
          ),
          if (_OnSearch == true)
            const Center()
          else if (_isLoding == true)
            loadingDataClass
          else
            Expanded(
                child: LazyLoadScrollView(
                    isLoading: isLoadingVertical,
                    onEndOfPage: () => _loadMoreVertical(),
                    child: ListView(
                      children: [
                        if (_videoType == true)
                          GridView.count(
                              mainAxisSpacing: 20.0,
                              crossAxisSpacing: 15.0,
                              physics: const ScrollPhysics(),
                              primary: false,
                              padding: const EdgeInsets.all(10),
                              scrollDirection: Axis.vertical,
                              crossAxisCount: 1,
                              childAspectRatio: (2 / 2 / 1),
                              shrinkWrap: true,
                              children:
                                  List.generate(verticalData.length, (index) {
                                return VideoCard(
                                  color: SearchData[index]['color'],
                                  img: SearchData[index]['img'],
                                  name: SearchData[index]['namevideo'],
                                  views: SearchData[index]['views'],
                                  Link: SearchData[index]['link'],
                                  id: SearchData[index]['id'],
                                  fav: true,
                                );
                              }))
                        else
                          GridView.count(
                              mainAxisSpacing: 20.0,
                              crossAxisSpacing: 15.0,
                              physics: const ScrollPhysics(),
                              primary: false,
                              padding: const EdgeInsets.all(10),
                              scrollDirection: Axis.vertical,
                              crossAxisCount: GetNumberViewGridBook(
                                  MediaQuery.of(context).size.width)[0],
                              childAspectRatio: GetNumberViewGridBook(
                                  MediaQuery.of(context).size.width)[1],
                              shrinkWrap: true,
                              children:
                                  List.generate(verticalData.length, (index) {
                                return BookCard(
                                  color: SearchData[index]['color'],
                                  img: SearchData[index]['img'],
                                  name: SearchData[index]
                                      [_bookType ? 'namebook' : 'titlemalazim'],
                                  views: SearchData[index]['views'],
                                  id: SearchData[index]['id'],
                                  pdf: SearchData[index]['pdf'],
                                  Type: _bookType ? 'book' : 'malazim',
                                  fav: true,
                                );
                              }))
                      ],
                    )))
        ],
      ),
    );
  }
}
