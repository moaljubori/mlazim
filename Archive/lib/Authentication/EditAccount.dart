// ignore_for_file: camel_case_types, deprecated_member_use, non_constant_identifier_names, file_names, prefer_final_fields
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Services/Functions/Variables.dart';
import '../../Services/Thems/Theme.dart';
import 'package:select_form_field/select_form_field.dart';

import '../Services/API/Api.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);
  @override
  _EditAccount_State createState() => _EditAccount_State();
}

class _EditAccount_State extends State<EditAccount> {
//TextEditingController variables ^^^^^^^^^^^^^^^
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _Forename = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  late String _city = '';
  final TextEditingController _age = TextEditingController();
  late int stateUser = 1;
  late   String _sex ='';
//TextEditingController variables ^^^^^^^^^^^^^^^

  @override
  void initState() {
    super.initState();
     getuser();
  }


   void getuser() async {
    
    final prefs = await SharedPreferences.getInstance();

if(prefs.getString('StateUserLogin').toString() =='5'){
 setState(() {
    stateUser = 0;
 });
}else{
 setState(() {
    stateUser = 1;
 });
}

    DioCacheManager _dioCacheManager;
    _dioCacheManager = DioCacheManager(CacheConfig());
    Options _cacheOptions =
        buildCacheOptions(const Duration(days: 10), forceRefresh: true);
    Dio _dio = Dio();
    _dio.interceptors.add(_dioCacheManager.interceptor);
    Response<Map> response = await _dio.get(
        api_website +
            'ServerApi/select_user.php?id=' +
            prefs.getString('IDUser').toString(),
        options: _cacheOptions);
    Map? responseBody = response.data;

    // List<Users> data = [];
    _phone.text = responseBody!['user'][0]['phone'];
    _email.text = responseBody['user'][0]['email'];
    _username.text = responseBody['user'][0]['username'];
    _Forename.text = responseBody['user'][0]['Forename'];
    _lastname.text = responseBody['user'][0]['lastname'];
    _city = responseBody['user'][0]['city'];
    _age.text = responseBody['user'][0]['age'];
    _sex = responseBody['user'][0]['sex'];
    // print(prefs.getString('IDUser').toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Modify Profile'.tr),
        //  backgroundColor: const Color.fromRGBO(61, 147, 221, 1),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
//Space --------------- ^^^^^^^^^^^^^^^
                  const SizedBox(height: 19),
//Space --------------- ^^^^^^^^^^^^^^^

//Email --------------- ^^^^^^^^^^^^^^^
                  TextFormField(
            
                    controller: _email,
                    decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(61, 147, 221, 1),
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(61, 147, 221, 1)),
                      iconColor: color_system,
                      labelText: 'Email'.tr,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.email),
                    ),
                  ),
//Email --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
                  const SizedBox(height: 19),
//Space --------------- ^^^^^^^^^^^^^^^

//Mobile Number --------------- ^^^^^^^^^^^^^^^
                  TextFormField(
                  
                    controller: _phone,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(61, 147, 221, 1)),
                      fillColor: color_system,
                      iconColor: color_system,
                      labelText: 'Mobile Number'.tr,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.phone),
                    ),
                  ),
//Mobile Number --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
                  const SizedBox(height: 19),
//Space --------------- ^^^^^^^^^^^^^^^

//Username --------------- ^^^^^^^^^^^^^^^
                  TextFormField(
                  
                    controller: _username,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(61, 147, 221, 1)),
                      fillColor: color_system,
                      iconColor: color_system,
                      labelText: 'Username'.tr,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.person),
                    ),
                  ),
//Username --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
                  const SizedBox(height: 19),
//Space --------------- ^^^^^^^^^^^^^^^

//First Name --------------- ^^^^^^^^^^^^^^^
                  TextFormField(
                  
                    controller: _Forename,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(61, 147, 221, 1)),
                      fillColor: color_system,
                      iconColor: color_system,
                      labelText: 'First Name'.tr,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.person_pin_outlined),
                    ),
                  ),
//First Name --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
                  const SizedBox(height: 19),
//Space --------------- ^^^^^^^^^^^^^^^

//Last Name --------------- ^^^^^^^^^^^^^^^
                  TextFormField(
                  
                    controller: _lastname,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(61, 147, 221, 1)),
                      fillColor: color_system,
                      iconColor: color_system,
                      labelText: 'Last Name'.tr,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.person_pin_outlined),
                    ),
                  ),
//Last Name --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
                  const SizedBox(height: 19),
//Space --------------- ^^^^^^^^^^^^^^^

//City --------------- ^^^^^^^^^^^^^^^
                  Container(
                    height: 55,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: Colors.black45,
                          style: BorderStyle.solid,
                          width: 0.80),
                    ),
                    child: SelectFormField(
                      type: SelectFormFieldType.dropdown,
                      labelText: 'City'.tr,
                      items: cityValue,
                      initialValue: _city,
                      onChanged: (val) => setState(() => {_city = val}),
                      onSaved: (val) => setState(() => {_city = val!}),
                    ),
                  ),
//City --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
                  const SizedBox(height: 19),
//Space --------------- ^^^^^^^^^^^^^^^

//Year Of Birth --------------- ^^^^^^^^^^^^^^^
                  TextFormField(
                  
                    controller: _age,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(61, 147, 221, 1)),
                      fillColor: const Color.fromRGBO(61, 147, 221, 1),
                      iconColor: color_system,
                      labelText: 'Year Of Birth'.tr,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.date_range),
                    ),
                  ),
//Year Of Birth --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
                  const SizedBox(height: 19),
//Space --------------- ^^^^^^^^^^^^^^^

                  Row(
                    children: [
//Save Changes --------------- ^^^^^^^^^^^^^^^
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () async {
                            
                          final prefs = await SharedPreferences.getInstance();
                          try {
                            var response = await Dio().get(api_website +
                                'ServerApi/edit_user.php?username=' +
                                _username.text +
                                '&Forename=' +
                                _Forename.text +
                                '&phone=' +
                                _phone.text +
                                '&email=' +
                                _email.text +
                                '&lastname=' +
                                _lastname.text +
                                '&city=' +
                                _city +
                                '&sex=' +
                                _sex +
                                '&age=' +
                                _age.text +
                                '&id=' +
                                prefs.getString('IDUser').toString());
                            Map? responseBody = response.data;
                                    // print(response.data);
                            for (var o in responseBody!['state']) {
                              if (o['u'] == '1') {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'تم تعديل المعلومات الخاصة بك'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text(
                                                'شكراً لك يمكنك متابعة استخدام البرنامج'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('اغلاق'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                              if (o['u'] == '3') {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'اسم المستخدم موجود مسبقاً'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text('يرجى كتابة اسم مستخدم اخر'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('اغلاق'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                              if (o['u'] == '2') {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'توجد مشكلة في اضافة الحساب'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text(
                                                'مشكلة غير معروفة في اضافة الحساب'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('اغلاق'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                              if (o['u'] == '4') {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'البريد الالكتروني مستخدم بالفعل'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text(
                                                'يرجى ادخال بريد الكتروني اخر'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('اغلاق'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          } catch (e) {
                          //  print(e);
                          }
                          },
                          child: Text(
                            'Save Changes'.tr,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      )
//Save Changes --------------- ^^^^^^^^^^^^^^^
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
