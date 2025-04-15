// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Services/API/Api.dart';
import 'Services/Functions/Variables.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(  const Splash());
}

 
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
 
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
 

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    final prefs = await SharedPreferences.getInstance();
    StateUserLogin = prefs.getString('StateUserLogin').toString();
      getThemeStatus();
    GetServerApi();
    await Future.delayed(const Duration(seconds: 1));
       loadCounter();
    await Future.delayed(const Duration(seconds: 1));
 
    Navigator.of(context).pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);
    FlutterNativeSplash.remove();
   
    
  }

  @override
  Widget build(BuildContext context) {
 
      
     return 
     
       Scaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 200,
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/logoSplash.png'),
                const SizedBox(height: 20,),
                const SizedBox(
                  width: 25,
                  height: 25,
                  child:   CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
     );
    
  
  }
}