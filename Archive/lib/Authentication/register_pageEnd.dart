// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, unused_field
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Services/Functions/Variables.dart';
import '../../Services/Thems/Theme.dart';
import '../Services/API/Api.dart';
import 'EndwindowCreateaccount.dart';

class register_pageEnd extends StatefulWidget {
   final String id;
  const register_pageEnd({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  _register_pageEndState createState() => _register_pageEndState();
}

class _register_pageEndState extends State<register_pageEnd> {
//Variables for entering and storing information ^^^^^^^^
  bool _male = true;
  bool _girl = false;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _Forename = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  late String _city = '';
  final TextEditingController _age = TextEditingController();
  var _sex = 'ذكر';
//Variables for entering and storing information ^^^^^^^^

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: isLightTheme.value? const AssetImage("assets/login/back_login.png") : const AssetImage("assets/login/darkbacLogin.png"),
            fit: BoxFit.cover),
      ),
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
// -----  Logo app ^^^^^^^^^^^^^^^^^
          const SizedBox(height: 40),
          Container(
            height: 120,
            margin: const EdgeInsets.only(left: 250),
            child: Image.asset("assets/login/" + imageLightSelect[2]),
          ),
// -----  Logo app ^^^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
          const SizedBox(height: 15),
//Space --------------- ^^^^^^^^^^^^^^^

//title --------------- ^^^^^^^^^^^^^^^
          Text(
            "Complete the registration process".tr,
            style: const TextStyle(fontSize: 25),
          ),
//title --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
          const SizedBox(height: 15),
//Space --------------- ^^^^^^^^^^^^^^^

//Username --------------- ^^^^^^^^^^^^^^^
          SizedBox(
            height: 54,
            child: TextFormField(
          
              controller: _username,
              decoration: InputDecoration(
                labelText: "Username".tr,
                fillColor: color_system,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: color_system,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
//Username --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
          const SizedBox(height: 15),
//Space --------------- ^^^^^^^^^^^^^^^

//First Name --------------- ^^^^^^^^^^^^^^^
          SizedBox(
            height: 54,
            child: TextFormField(
        
              controller: _Forename,
              decoration: InputDecoration(
                labelText: "First Name".tr,
                fillColor: color_system,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: color_system,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
//First Name --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
          const SizedBox(height: 15),
//Space --------------- ^^^^^^^^^^^^^^^

//Last Name --------------- ^^^^^^^^^^^^^^^
          SizedBox(
            height: 54,
            child: TextFormField(
       
              controller: _lastname,
              decoration: InputDecoration(
                labelText: "Last Name".tr,
                fillColor: color_system,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: color_system,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
//Last Name --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
          const SizedBox(height: 15),
//Space --------------- ^^^^^^^^^^^^^^^

//City --------------- ^^^^^^^^^^^^^^^
          Container(
            height: 55,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.blueAccent)),
            child: SelectFormField(
              type: SelectFormFieldType.dropdown, // or can be dialog
              labelText: 'City'.tr,
              items: cityValue,
             
              onChanged: (val) => setState(() => {_city = val}),
              onSaved: (val) => setState(() => {_city = val!}),
            ),
          ),
//City --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
          const SizedBox(height: 15),
//Space --------------- ^^^^^^^^^^^^^^^

//Year Of Birth --------------- ^^^^^^^^^^^^^^^
          Container(
            height: 55,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.blueAccent)),
            child: SelectFormField(
              type: SelectFormFieldType.dropdown, // or can be dialog
              labelText: 'Year Of Birth'.tr,
              items: YearList,
              onChanged: (val) => setState(() => {_age.text = val}),
              onSaved: (val) => setState(() => {_age.text = val!}),
            ),
          ),
//Year Of Birth --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
          const SizedBox(height: 15),
//Space --------------- ^^^^^^^^^^^^^^^

//Male Or Female --------------- ^^^^^^^^^^^^^^^
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Flexible(
// ignore: deprecated_member_use
                    child: FlatButton(
                  minWidth: double.infinity,
                  color: _male ? color_system : Colors.black38,
                  textColor: Colors.white,
                  onPressed: () => setState(
                      () => {_male = true, _girl = false, _sex = 'ذكر'}),
                  child: Text('Male'.tr),
                )),
                const SizedBox(width: 15),
                Flexible(
// ignore: deprecated_member_use
                    child: FlatButton(
                  minWidth: double.infinity,
                  color: _girl ? color_system : Colors.black38,
                  textColor: Colors.white,
                  onPressed: () => setState(
                      () => {_male = false, _girl = true, _sex = 'انثى'}),
                  child: Text('Female'.tr),
                ))
              ],
            ),
          ),
//Male Or Female --------------- ^^^^^^^^^^^^^^^

//Space --------------- ^^^^^^^^^^^^^^^
          const SizedBox(height: 15),
//Space --------------- ^^^^^^^^^^^^^^^

//Next --------------- ^^^^^^^^^^^^^^^
          SizedBox(
              height: 45,
// ignore: deprecated_member_use
              child: FlatButton(
                minWidth: double.infinity,
                height: 48,
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () async {



                  final prefs = await SharedPreferences.getInstance();
                  try {
                    var response = await Dio().get(api_website +
                        'ServerApi/UserEditBeforeAdd.php?username=' +
                        _username.text +
                        '&Forename=' +
                        _Forename.text +
                        '&lastname=' +
                        _lastname.text +
                        '&city=' +
                        _city +
                        '&sex=' +
                        _sex +
                        '&age=' +
                        _age.text +
                        '&id=' +
                        widget.id);
                    Map? responseBody = response.data;
                    for (var o in responseBody!['state']) {
                      if (o['u'] == '1') {
                        prefs.setString('StateUserLogin', '1');
                        prefs.setString('IDUser', widget.id);
                        Get.to( EndwindowCreateaccount(id:widget.id));
                   
                      }
                      if (o['u'] == '3') {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Username not available'.tr ,  textAlign: TextAlign.center,),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text("Please type another username".tr,textAlign: TextAlign.center,),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('close'.tr),
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
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                  'There is a problem in adding the account'
                                      .tr ,  textAlign: TextAlign.center,),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        'Unknown problem in adding account'.tr , textAlign: TextAlign.center,),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('close'.tr),
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


                },
                child: Text('Next'.tr),
              )),
//Next --------------- ^^^^^^^^^^^^^^^
        ],
      ),
    ));
  }
}
