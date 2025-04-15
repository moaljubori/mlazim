// ignore_for_file: file_names, non_constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Services/Thems/Theme.dart';
import '../Services/API/Api.dart';
import '../Services/Functions/Variables.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
//Email and password variables ^^^^^^^^^^^^^^^
  final TextEditingController _Email = TextEditingController();
  final TextEditingController _Password = TextEditingController();
//Email and password variables ^^^^^^^^^^^^^^^

  @override
  void initState() {
    super.initState();
  }

  // void _loadCounter() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     if (prefs.getString('StateUserLogin') == '1') {

  //             Navigator.pushNamedAndRemoveUntil(
  //                               context, "/", (r) => false);
  //     }
  //     if (prefs.getString('StateUserLogin') == '5') {
  //            Navigator.pushNamedAndRemoveUntil(
  //                               context, "/", (r) => false);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: isLightTheme.value
                  ? const AssetImage("assets/login/back_login.png")
                  : const AssetImage("assets/login/darkbacLogin.png"),
              fit: BoxFit.cover),
        ),
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: <Widget>[
            const SizedBox(height: 40),

// Page ^^^^^^^^^^^^^^^^^^^^^^^^^^
            Container(
              height: 120,
              margin: LangSet
                  ? const EdgeInsets.only(left: 250)
                  : const EdgeInsets.only(right: 250),
              child: Image.asset("assets/login/" + imageLightSelect[2]),
            ),
//  Page ^^^^^^^^^^^^^^^^^^^^^^^^^^

//Title Page ^^^^^^^^^^^^^^^^^^^^^^^^^^
            const SizedBox(height: 15),
            Text(
              'Login'.tr,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
//Title Page ^^^^^^^^^^^^^^^^^^^^^^^^^^

            const SizedBox(height: 25),

//Email Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^
            Container(
              color: isLightTheme.value
                  ? Colors.white
                  : const Color.fromRGBO(1, 38, 63, 1),
              height: 50,
              child: Form(
                child: TextFormField(
                  controller: _Email,
                  validator: (value) => EmailValidator.validate(_Email.text)
                      ? null
                      : "invalid_email".tr,
                  style: const TextStyle(fontFamily: 'Cairo-Regular'),
                  decoration: InputDecoration(
                    labelText: "Email".tr,
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
            ),
//Email Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^

            const SizedBox(height: 15),

//Password Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^
            Container(
              color: isLightTheme.value
                  ? Colors.white
                  : const Color.fromRGBO(1, 38, 63, 1),
              height: 50,
              child: TextFormField(
                obscureText: true,
                style: const TextStyle(fontFamily: 'Cairo-Regular'),
                controller: _Password,
                decoration: InputDecoration(
                  labelText: "Password".tr,
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
//Password Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^

            const SizedBox(height: 15),

//Button Input RestPassword ^^^^^^^^^^^^^^^^^^^^^^^^^^
            SizedBox(
              height: 30,
              child: GestureDetector(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, "/ForgotPassword", (r) => false),
                child: Text(
                  'Forget Password'.tr,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
//Button Input RestPassword ^^^^^^^^^^^^^^^^^^^^^^^^^^

            const SizedBox(height: 15),

//Button Input Login ^^^^^^^^^^^^^^^^^^^^^^^^^^
            Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(61, 147, 221, 1),
                          Color.fromARGB(255, 122, 192, 249)
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                height: 60,
                padding: const EdgeInsets.only(left: 10, right: 10),
// ignore: deprecated_member_use
                child: TextButton(
                  //minWidth: double.infinity,
                  //textColor: Colors.white,
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
//data server
                    Response<Map> response = await Dio().get(
                      api_website +
                          'ServerApi/login.php?email=' +
                          _Email.text +
                          '&password=' +
                          _Password.text,
                    );
                    Map? responseBody = response.data;

                    for (var o in responseBody!['state']) {
                      prefs.setString('StateUserLogin', o['u']);

                      StateUserLogin = o['u'];
                      if (o['u'] == '1') {
                        prefs.setString('IDUser', o['id']);
                        prefs.setString('userphone', o['phone']);
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/Home", (r) => false);
                      }

                      if (o['u'] == '2') {
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'invalid_email'.tr,
                                textAlign: TextAlign.center,
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                      "Please_try_again!!".tr,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Returnx'.tr),
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
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Passwords do not match".tr),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text("Please try again!!".tr),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Returnx'.tr),
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
                  },
                  child: Text(
                    'Entry'.tr,
                    style: const TextStyle(fontSize: 21),
                  ),
                )),
//Button Input Login ^^^^^^^^^^^^^^^^^^^^^^^^^^

            const SizedBox(height: 15),

//Button Input You don't have an account? ^^^^^^^^^^^^^^^^^^^^^^^^^^
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text("You don't have an account?".tr),
                  ),
                  const SizedBox(width: 7),
                  GestureDetector(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context, "/CreateAccount", (r) => false),
                    child: Text(
                      'Create An Account'.tr,
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
//Button Input You don't have an account? ^^^^^^^^^^^^^^^^^^^^^^^^^^

//Button Input Or ^^^^^^^^^^^^^^^^^^^^^^^^^^
            Container(
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Expanded(child: Divider()),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(width: 20, child: Text('Or'.tr)),
                  const Expanded(child: Divider())
                ],
              ),
            ),
//Button Input Or ^^^^^^^^^^^^^^^^^^^^^^^^^^

            SizedBox(
                height: 55,
                child: OutlinedButton(
                  onPressed: () async {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/Home", (r) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person_outlined,
                        size: 30,
                      ),
                      Text(
                        'Login As Visitor'.tr,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(61, 147, 221, 1)),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
