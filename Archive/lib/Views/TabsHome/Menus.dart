// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malazim_iq/Views/SubPages/About.dart';
import 'package:malazim_iq/Views/SubPages/FollowUS.dart';
import 'package:malazim_iq/Views/SubPages/Privacy_Policy.dart';
import 'package:malazim_iq/Views/SubPages/Settings.dart';
import 'package:malazim_iq/Views/SubPages/Supporters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Authentication/CreateAccount.dart';
import '../../Authentication/Login.dart';
import '../../Services/Functions/Variables.dart';

//Class  --------------- ^^^^^^^^^^^^^^^
class Menus extends StatefulWidget {
  const Menus({Key? key}) : super(key: key);
  @override
  MenusState createState() => MenusState();
}
//Class  --------------- ^^^^^^^^^^^^^^^

//UI Class  --------------- ^^^^^^^^^^^^^^^
class MenusState extends State<Menus> {
  late String StateLogin = '';

//Content --------------- ^^^^^^^^^^^^^^^
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
//space --------------- ^^^^^^^^^^^^^^^
        const SizedBox(height: 20),
//space --------------- ^^^^^^^^^^^^^^^

        Wrap(
          children: [
//ListTile Supporters --------------- ^^^^^^^^^^^^^^^
            ListTile(
              leading: Image.asset('assets/more_icons/z1.png'),
              title: Text(
                'Supporters'.tr,
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 17),
              onTap: () => Get.to(const PageSupporters()),
            ),
//ListTile Supporters --------------- ^^^^^^^^^^^^^^^

//Divider  --------------- ^^^^^^^^^^^^^^^
            const Divider(height: 1, color: Colors.black12),
//Divider  --------------- ^^^^^^^^^^^^^^^

//ListTile Follow --------------- ^^^^^^^^^^^^^^^
            ListTile(
              leading: Image.asset('assets/more_icons/z2.png'),
              title: Text(
                'Follow Us'.tr,
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 17),
              onTap: () => Get.to(const FollowUS()),
            ),
//ListTile Follow --------------- ^^^^^^^^^^^^^^^

//Divider  --------------- ^^^^^^^^^^^^^^^
            const Divider(height: 1, color: Colors.black12),
//Divider  --------------- ^^^^^^^^^^^^^^^

//ListTile About --------------- ^^^^^^^^^^^^^^^
            ListTile(
              leading: Image.asset('assets/more_icons/z3.png'),
              title: Text(
                'About Us'.tr,
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 17),
              onTap: () => Get.to(const AboutPage()),
            ),
//ListTile About --------------- ^^^^^^^^^^^^^^^

//Divider  --------------- ^^^^^^^^^^^^^^^
            const Divider(height: 1, color: Colors.black12),
//Divider  --------------- ^^^^^^^^^^^^^^^

//ListTile Settings --------------- ^^^^^^^^^^^^^^^
            ListTile(
              leading: Image.asset('assets/more_icons/z4.png'),
              title: Text(
                'Settings'.tr,
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 17),
              onTap: () => Get.to(const PageSettings()),
            ),
//ListTile Settings --------------- ^^^^^^^^^^^^^^^

//Divider  --------------- ^^^^^^^^^^^^^^^
            const Divider(height: 1, color: Colors.black12),
//Divider  --------------- ^^^^^^^^^^^^^^^

//ListTile Privacy policy --------------- ^^^^^^^^^^^^^^^
            ListTile(
              leading: Image.asset('assets/more_icons/z5.png'),
              title: Text(
                'Privacy policy'.tr,
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 17),
              onTap: () => Get.to(const PagePrivacypolicy()),
            ),
//ListTile Privacy policy --------------- ^^^^^^^^^^^^^^^

//Divider  --------------- ^^^^^^^^^^^^^^^
            const Divider(height: 1, color: Colors.black12),
//Divider  --------------- ^^^^^^^^^^^^^^^

//space --------------- ^^^^^^^^^^^^^^^
            const SizedBox(height: 15),
//space --------------- ^^^^^^^^^^^^^^^

            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (StateUserLogin == '1') ...[
                    GestureDetector(
                      child: LangSet ? Image.asset('assets/login/out.png') : Image.asset('assets/login/outEN.png'),
 
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString('StateUserLogin', '5');
                        Navigator.pushNamed(context, '/');
                      },
                    )
                  ] else ...[
                    GestureDetector(
child: LangSet ? Image.asset('assets/login/login.png') : Image.asset('assets/login/loginEN.png'),
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString('StateUserLogin', '2');
                        Get.to(const Login(), arguments: "Hello World!");
                      },
                    ),
                    GestureDetector(
  
                      child: LangSet ? Image.asset('assets/login/Create.png') : Image.asset('assets/login/CreateEN.png'),
 
                      onTap: () {
                        Get.to(const CreateAccount());
                      },
                    )
                  ]
                ],
              ),
            ),

            const SizedBox(height: 50),
          ],
        )
      ],
    ));
  }
}
