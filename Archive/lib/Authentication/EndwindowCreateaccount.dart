// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Services/Thems/Theme.dart';
import '../Services/Functions/Variables.dart';

class EndwindowCreateaccount extends StatefulWidget {
   final String id;
  const EndwindowCreateaccount({
    Key? key,
    required this.id,
  }) : super(key: key);


  @override
  _EndwindowCreateaccountState createState() => _EndwindowCreateaccountState();
}

class _EndwindowCreateaccountState extends State<EndwindowCreateaccount> {
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
// -----  Logo app ^^^^^^^^^^^^^^^^^
          const SizedBox(height: 40),
          Container(
            height: 120,
            margin: const EdgeInsets.only(left: 250),
            child: Image.asset("assets/login/" + imageLightSelect[2]),
          ),
// -----  Logo app ^^^^^^^^^^^^^^^^^

          const SizedBox(height: 15),

// -----  title Your account has been created ^^^^^^^^^^^^^^^^^
          Text(
            'Your account has been created'.tr,
            style: const TextStyle(fontSize: 25),
          ),
// -----  title Your account has been created ^^^^^^^^^^^^^^^^^

          const SizedBox(height: 15),

// -----  title Your account has been created ^^^^^^^^^^^^^^^^^
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
              child: FlatButton(
                minWidth: double.infinity,
                height: 48,
                textColor: Colors.white,
                onPressed: () {
                   Navigator.pushNamedAndRemoveUntil(context, "/Home", (r) => false);
                
                },
                child: Text(
                  'Go to the main board'.tr,
                  style: const TextStyle(fontSize: 18),
                ),
              )),
// -----  title Your account has been created ^^^^^^^^^^^^^^^^^

          const SizedBox(height: 15),

// -----  another option ^^^^^^^^^^^^^^^^^
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text('another option'.tr),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: GestureDetector(
                    child: Text(
                      'sign out'.tr,
                      style: const TextStyle(
                          color: Color.fromRGBO(227, 54, 106, 1)),
                    ),
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('StateUserLogin', '2');
 Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
                     
                    },
                  ),
                )
              ],
            ),
          ),
// -----  another option ^^^^^^^^^^^^^^^^^
        ],
      ),
    ));
  }
}
