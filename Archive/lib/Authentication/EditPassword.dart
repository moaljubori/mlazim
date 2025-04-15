// ignore_for_file: camel_case_types, deprecated_member_use, file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Services/Thems/Theme.dart';
import '../Services/API/Api.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({Key? key}) : super(key: key);
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
//TextEditingController variables ^^^^^^^^^^^^^^^
  final TextEditingController _Oldpassword = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _Rpassword = TextEditingController();
  var password;
    void getuser() async {
    final prefs = await SharedPreferences.getInstance();

    Response<Map> response = await Dio().get(
        api_website +
            'ServerApi/select_user.php?id=' +
            prefs.getString('IDUser').toString());
    Map? responseBody = response.data;

    password = responseBody!['user'][0]['password'];
  }
//TextEditingController variables ^^^^^^^^^^^^^^^

  @override
  void initState() {
    super.initState();
     getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Change Password".tr),
          backgroundColor: const Color.fromRGBO(61, 147, 221, 1),
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

//Old Password --------------- ^^^^^^^^^^^^^^^
                  TextFormField(
                   
                    obscureText: true,
                    controller: _Oldpassword,
                    decoration: InputDecoration(
                      fillColor: color_system,
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(61, 147, 221, 1)),
                      iconColor: color_system,
                      labelText: "Old Password".tr,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.password),
                    ),
                  ),
//Old Password --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
                  const SizedBox(height: 19),
//Space --------------- ^^^^^^^^^^^^^^^

//New Password --------------- ^^^^^^^^^^^^^^^
                  TextFormField(
                   
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(
                      fillColor: color_system,
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(61, 147, 221, 1)),
                      iconColor: color_system,
                      labelText: "New Password".tr,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.password),
                    ),
                  ),
//New Password --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
                  const SizedBox(height: 19),
//Space --------------- ^^^^^^^^^^^^^^^

//Confirm Password --------------- ^^^^^^^^^^^^^^^
                  TextFormField(
                   
                    obscureText: true,
                    controller: _Rpassword,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(61, 147, 221, 1)),
                      fillColor: color_system,
                      iconColor: color_system,
                      labelText: "Confirm Password".tr,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.password),
                    ),
                  ),
//Confirm Password --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
                  const SizedBox(height: 19),
//Space --------------- ^^^^^^^^^^^^^^^

//Save Changes --------------- ^^^^^^^^^^^^^^^
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () async {
                             final prefs = await SharedPreferences.getInstance();
                          if (_Oldpassword.text == password) {
                            if (_password.text == _Rpassword.text) {
                              try {
                                var response = await Dio().get(api_website +
                                    'ServerApi/EditUserPassword.php?password=' +
                                    _Rpassword.text +
                                    '&id=' +
                                    prefs.getString('IDUser').toString());
                                Map? responseBody = response.data;
                                for (var o in responseBody!['state']) {
                                  if (o['u'] == '1') {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              'تم تغيير كلمة المرور الخاصة بك '),
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
                                  if (o['u'] == '2') {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              'توجد مشكلة في ارسال المعلومات'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: const <Widget>[
                                                Text(
                                                    'مشكلة غير معروفة في ارسال البيانات'),
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
                               // print(e);
                              }
                            } else {
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                        'كلمة المرور الجديدة غير مطابقة'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: const <Widget>[
                                          Text('اعد كتابة كلمة المرور الجديدة'),
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
                          } else {
                            showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                      'كلمة المرور القديمة غير صحيحة'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text('كلمة المرور القديمة غير صحيحة'),
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
                      },
                      child: Text(
                        'Save Changes'.tr,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  )
//Save Changes --------------- ^^^^^^^^^^^^^^^
                ],
              ),
            )
          ],
        ));
  }
}
