// ignore_for_file: file_names, non_constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:email_validator/email_validator.dart';
import 'package:malazim_iq/Authentication/register_pageEnd.dart';
import '../../Services/Thems/Theme.dart';
import '../Services/API/Api.dart';
import '../Services/Functions/Variables.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  void initState() {
    super.initState();
  }

  //Function to get country number ^^^^^^^^^^^^^^^^^
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'IQ');
    setState(() {
      this.number = number;
    });
  }
  //Function to get country number ^^^^^^^^^^^^^^^^^

//Variables for entering and storing information ^^^^^^^^
  final TextEditingController _email = TextEditingController();
// ignore: unused_field
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _Repassword = TextEditingController();
  late String sendnumber = '';
  late Color vcolor = color_system;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IQ';
  PhoneNumber number = PhoneNumber(isoCode: 'IQ');
//Variables for entering and storing information ^^^^^^^^

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
// -----  The background of the account creation screen ^^^^^^^
      decoration: BoxDecoration(
        image: DecorationImage(
            image: isLightTheme.value
                ? const AssetImage("assets/login/back_login.png")
                : const AssetImage("assets/login/darkbacLogin.png"),
            fit: BoxFit.cover),
      ),
// -----  The background of the account creation screen ^^^^^^^

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

          const SizedBox(height: 5),

// -----  Title Page ^^^^^^^^^^^^^^^^^^^^^^^^^^
          SizedBox(
              height: 50,
              child: Text(
                'Create An Account'.tr,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
// -----  Title Page ^^^^^^^^^^^^^^^^^^^^^^^^^^

          const SizedBox(height: 15),

// -----  Email Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^
          Container(
            color: isLightTheme.value
                ? Colors.white
                : const Color.fromRGBO(1, 38, 63, 1),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                onChanged: (value) => EmailValidator.validate(_email.text)
                    ? null
                    : "invalid_email".tr,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontFamily: 'Cairo-Regular'),
                controller: _email,
                validator: (value) => EmailValidator.validate(_email.text)
                    ? null
                    : "invalid_email".tr,
                decoration: InputDecoration(
                  labelText: "Email".tr,
                  fillColor: color_system,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: color_system,
                      width: 1.0,
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
// -----  Email Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^

          const SizedBox(height: 15),

// -----  PhoneNumber Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^
          Container(
            color: isLightTheme.value
                ? Colors.white
                : const Color.fromRGBO(1, 38, 63, 1),
            height: 54,
            child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                setState(() {
                  sendnumber = number.phoneNumber.toString();
                });
              },
              onInputValidated: (bool value) {
                if (value == true) {
                  vcolor = color_system;
                } else {
                  vcolor = Colors.red;
                }
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.blue),
              initialValue: number,
              textFieldController: controller,
              formatInput: false,
              inputDecoration: InputDecoration(
                labelText: "Mobile Number".tr,
                fillColor: color_system,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: vcolor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: vcolor,
                    width: 1.0,
                  ),
                ),
              ),
              textStyle: const TextStyle(color: Colors.blue),
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              inputBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
// -----  PhoneNumber Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^

          const SizedBox(height: 15),

// -----  password Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^
          Container(
            color: isLightTheme.value
                ? Colors.white
                : const Color.fromRGBO(1, 38, 63, 1),
            height: 50,
            child: TextFormField(
              style: const TextStyle(fontFamily: 'Cairo-Regular'),
              obscureText: true,
              controller: _password,
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
// -----  password Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^

          const SizedBox(height: 15),

// -----  Confirm Password Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^
          Container(
            color: isLightTheme.value
                ? Colors.white
                : const Color.fromRGBO(1, 38, 63, 1),
            height: 50,
            child: TextFormField(
              style: const TextStyle(fontFamily: 'Cairo-Regular'),
              obscureText: true,
              controller: _Repassword,
              decoration: InputDecoration(
                labelText: "Confirm Password".tr,
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
// -----  Confirm Password Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^

          const SizedBox(height: 15),

// -----  Confirm Password Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^
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
// ignore: deprecated_member_use
              child: TextButton(
                //minWidth: double.infinity,
                //height: 60,
                //textColor: Colors.white,
                onPressed: () async {
// ignore: unnecessary_null_comparison
                  if (_email.text == '' &&
                      _phone.text == '' &&
                      _password.text == '' &&
                      _Repassword.text == '') {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Please_enter'.tr,
                            textAlign: TextAlign.center,
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                  'Please_try_again!!'.tr,
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
                  } else {
                    if (_password.text == _Repassword.text) {
                      try {
                        var response = await Dio().get(api_website +
                            'ServerApi/CreateUser.php?email=' +
                            _email.text +
                            '&password=' +
                            _password.text +
                            '&phone=' +
                            sendnumber);
                        Map? responseBody = response.data;
                        for (var o in responseBody!['state']) {
                          if (o['u'] == '1') {
//Navigator.pushNamed(context, '/register_pageEnd',arguments: {'id': o['id']});
                            Get.to(register_pageEnd(
                              id: o['id'],
                            ));
                          }

                          if (o['u'] == '3') {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'The_account_already_exists!!'.tr,
                                    textAlign: TextAlign.center,
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                          'Please enter another email or login'
                                              .tr,
                                          textAlign: TextAlign.center,
                                        ),
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
                          if (o['u'] == '4') {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'The_Number_Phone_already_exists!!'.tr,
                                    textAlign: TextAlign.center,
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                          'Please enter another Phone or login'
                                              .tr,
                                          textAlign: TextAlign.center,
                                        ),
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
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'There is a problem in adding the account'
                                        .tr,
                                    textAlign: TextAlign.center,
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                          'Unknown problem in adding account'
                                              .tr,
                                          textAlign: TextAlign.center,
                                        ),
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
                    } else {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Passwords do not match'.tr,
                              textAlign: TextAlign.center,
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text(
                                    'Please try again!!'.tr,
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
                  }
                },
                child: Text(
                  'Next'.tr,
                  style: const TextStyle(fontSize: 21),
                ),
              )),
// -----  Confirm Password Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^

          const SizedBox(height: 15),

// -----  Have An Account Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text('Have An Account'.tr),
                ),
                const SizedBox(width: 7),
                Expanded(
                    child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                              context,
                              '/login',
                              arguments: {
                                'none': '',
                              },
                            ),
                        child: Text(
                          'Login'.tr,
                          style: const TextStyle(
                              color: Color.fromRGBO(227, 54, 106, 1)),
                        ))),
              ],
            ),
          ),
// -----  Have An Account Input   ^^^^^^^^^^^^^^^^^^^^^^^^^^

          const SizedBox(height: 15),

// -----  Login As Visitor   ^^^^^^^^^^^^^^^^^^^^^^^^^^
          SizedBox(
            height: 50,
            child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/',
                    arguments: {
                      'none': '',
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person),
                    Text(
                      'Login As Visitor'.tr,
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                )),
          )
// -----  Login As Visitor   ^^^^^^^^^^^^^^^^^^^^^^^^^^
        ],
      ),
    ));
  }
}
