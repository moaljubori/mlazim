// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malazim_iq/Authentication/EditPassword.dart';
import 'package:malazim_iq/Authentication/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Services/Thems/Theme.dart';
import '../../Authentication/EditAccount.dart';
import '../../Services/API/Api.dart';
import '../../Services/Functions/Variables.dart';
 
class PageSettings extends StatefulWidget {
  const PageSettings({Key? key}) : super(key: key);
  @override
  _PageSettingsState createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  final RxBool _isLightTheme = false.obs;
 
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  _saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', _isLightTheme.value);
    
    setState(() {
          isLightTheme.value = _isLightTheme.value;
    });
  }

  _getThemeStatus() async {
    var _isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    _isLightTheme.value = (await _isLight.value);
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  setState(() {
    isLightTheme.value = _isLightTheme.value;
  });
  
  }

  MyApp() {
    _getThemeStatus();
  }

  int _counter = 0;
  @override
  void initState() {
    super.initState();
    _getThemeStatus();
    _loadCounter();
  }

  String lang = 'العربية';
  //Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
      if (prefs.getInt('counter') == 1) {
        lang = 'العربية';
       
      }
      if (prefs.getInt('counter') == 2) {
        lang = 'English';
       
      }
    });
  }

  //Incrementing counter after click
  void _incrementCounter(index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = index;
      prefs.setInt('counter', _counter);
   GetServerApi();
    });
  }

  int val = -1;

  final int count = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Settings'.tr),
        ),
        body: ListView(
          children: [
            Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.language_outlined),
                  title: Text('Language'.tr),
                  subtitle: Text(lang),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 17),
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Language'.tr),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            ListTile(
                              title: Text("DefaultU".tr),
                              leading: Radio(
                                value: 1,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    LangSet = true;
                                    updateLanguage(const Locale('ar', 'AR'));
                                    lang = 'العربية';
                                    _incrementCounter(1);
                               
                                    val = 1;
                                  });
                                },
                                activeColor: color_system,
                              )),
                          ListTile(
                              title: Text("Arabic".tr),
                              leading: Radio(
                                value: 2,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    LangSet = true;
                                    updateLanguage(const Locale('ar', 'AR'));
                                    lang = 'العربية';
                                    _incrementCounter(1);
                                 
                                    val = 2;
                                  });
                                },
                                activeColor: color_system,
                              )),
                          ListTile(
                            title: Text("English".tr),
                            leading: Radio(
                              value: 3,
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  LangSet = false;
                                  updateLanguage(const Locale('en', 'US'));
                                  lang = 'English';
                                  _incrementCounter(2);
                                 
                                  val = 3;
                                });
                              },
                              activeColor: color_system,
                            ),)
                     
                      
                  
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: Text('Cancel'.tr),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: Text('Selection'.tr),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 1, color: Colors.black12),
                ListTile(
                  leading: const Icon(Icons.notifications_outlined),
                  title: Text('Notifications'.tr),
                  subtitle: Text('Notifications'.tr),
                ),
                Container(height: 1, color: Colors.black12),
                ListTile(
                  leading: const Icon(Icons.nightlight_round_outlined),
                  title: Text('Appearance'.tr),
                   trailing: ObxValue(
                    (data) => Switch(
                      value: _isLightTheme.value,
                      onChanged: (val) {
                        _isLightTheme.value = val;
                        Get.changeThemeMode(
                          _isLightTheme.value
                              ? ThemeMode.light
                              : ThemeMode.dark,
                        );
                        _saveThemeStatus();
                      },
                    ),
                    false.obs,
                  ),
                ),
                Container(height: 1, color: Colors.black12),
                 if (StateUserLogin == '1')
                ListTile(
                  leading: const Icon(Icons.people),
                  title: Text(
                    'Modify Profile'.tr,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 17),
                  onTap: () => Get.to(const EditAccount()),
                ),
                Container(height: 1, color: Colors.black12),
                 if (StateUserLogin == '1')
                ListTile(
                  leading: const Icon(Icons.lock_outline),
                  title: Text(
                    'Change Password'.tr,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 17),
                  onTap: () => Get.to(const EditPassword()),
                ),
                  if (StateUserLogin == '1')
                   ListTile(
                  leading: const Icon(Icons.delete , color: Colors.red,),
                  title: Text(
                    'Delete My Account'.tr,
                    style: const TextStyle(color: Colors.red),
                  ),
                  onTap: () =>   {
                    
 
showDialog(
   
builder: (context) =>
CupertinoAlertDialog(
  
title:  const Text('حذف الحساب ؟؟؟'),
content: 
Padding(padding: const EdgeInsets.all(10),child: 
Column(
children: [

  
  const Text('هل انت متاكد من حذف حسابك نهائياَ'),

const SizedBox(height: 10,),
  

OutlinedButton(
style: OutlinedButton.styleFrom(shape: const RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(10))),
primary: color_system),

onPressed: () {
DeleteAccount();
Get.to(const Login());
 
},
child: Row(
crossAxisAlignment:CrossAxisAlignment.center,
children: [
Text('حذف الحساب'.tr,
style: const TextStyle(fontWeight:FontWeight.normal,color: Colors.red)),
const Icon(Icons.delete,size: 15,color: Colors.red,)
]),
)

  ],
)

,),
actions: const <Widget>[ ],
),
context: context)

                  },
                ),
                Container(height: 1, color: Colors.black12),
                Container(height: 15),
                const SizedBox(width: double.infinity, height: 50),
              ],
            )
          ],
        ));
  }
}
