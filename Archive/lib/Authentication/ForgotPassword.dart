// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../Services/Thems/Theme.dart';
import '../Services/Functions/Variables.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
// -----  The background of the account creation screen ^^^^^^^
      decoration: BoxDecoration(
        image: DecorationImage(
            image: isLightTheme.value? const AssetImage("assets/login/back_login.png") : const AssetImage("assets/login/darkbacLogin.png"),
            fit: BoxFit.cover),
      ),
// -----  The background of the account creation screen ^^^^^^^

      child: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          const SizedBox(height: 120),

// -----  TitlePage Password Recovery ^^^^^^^
          SizedBox(
              height: 45,
              child: Text(
                'Password Recovery'.tr,
                style: const TextStyle(fontSize: 25),
              )),
// -----  TitlePage Password Recovery ^^^^^^^

// -----  Enter your e-mail to reset the password ^^^^^^^
          SizedBox(
              height: 80,
              child: AutoSizeText("Enter your e-mail to reset the password".tr,
                  minFontSize: 14,
                  maxFontSize: 18,
                  maxLines: 15,
                  textAlign: LangSet? TextAlign.right : TextAlign.left,
                  overflow: TextOverflow.fade)),
// -----  Enter your e-mail to reset the password ^^^^^^^

          const SizedBox(height: 15),

// -----  Email ^^^^^^^
          SizedBox(
            height: 45,
            child: TextFormField(
              style: const TextStyle(fontFamily: 'JannaBold'),
              initialValue: '',
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
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
// -----  Email ^^^^^^^

          const SizedBox(height: 15),

//Button Send Request --------- ^^^^^^^^^^^
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
              child: FlatButton(
                minWidth: double.infinity,
                textColor: Colors.white,
                onPressed: () async {},
                child: Text(
                  'Send Request'.tr,
                  style: const TextStyle(fontSize: 21),
                ),
              )),
//Button Send Request --------- ^^^^^^^^^^^

          const SizedBox(height: 15),

//Button back --------- ^^^^^^^^^^^
          SizedBox(
            height: 30,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                '/',
                arguments: {
                  'none': '',
                },
              ),
              child: Flexible(
                  child: Text(
                'back'.tr,
                textAlign: TextAlign.start,
              )),
            ),
          )
//Button back --------- ^^^^^^^^^^^
        ],
      ),
    ));
  }
}
