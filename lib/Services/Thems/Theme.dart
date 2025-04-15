// ignore_for_file: non_constant_identifier_names, prefer_const_declarations, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


final color_system = const Color.fromRGBO(61, 147, 221, 1);


var imageLightSelect = li_se;
final li_se = ['back_login.png', 'add.png' , 'blacklogo.png'];
final dr_se = ['darkbacLogin.jpg', 'addDark.png'  , 'whitelogo.png'];




class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}



// select dark theme
ThemeData ThemeDark = ThemeData(

  scaffoldBackgroundColor: const Color.fromRGBO(1, 38, 63, 1),
  dividerColor: Colors.black26,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(1, 38, 63, 1),),
   fontFamily: 'Cairo-Regular',
   bottomNavigationBarTheme:BottomNavigationBarThemeData(
    backgroundColor: color_system),
   textTheme: TextTheme(
   headline1: TextStyle(color: color_system),
   headline2: const TextStyle(color: Colors.white)
   ),
 
  primaryColor: Colors.lightBlue[800],
  tabBarTheme:const TabBarTheme(
  labelColor: Colors.white,
   unselectedLabelColor: Colors.white
   ),
  primaryColorLight: Colors.white,
  backgroundColor: const Color.fromRGBO(20, 60, 87, 1),

    colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    backgroundColor:  const Color.fromRGBO(239, 239, 239, 1),
    primarySwatch: Colors.blue,
    accentColor: Colors.black,
    primaryColorDark: Colors.white
    ).copyWith(
    secondary: Colors.white,
    background: const Color.fromRGBO(239, 239, 239, 1),
  ),

);


// select light theme
ThemeData ThemeLight = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  dividerColor: Colors.black26,
  appBarTheme: const AppBarTheme(backgroundColor: Color.fromRGBO(61, 147, 221, 1),),
   fontFamily: 'Cairo-Regular',
   bottomNavigationBarTheme:BottomNavigationBarThemeData(backgroundColor: color_system),
   textTheme: TextTheme(
   headline1: TextStyle(color: color_system),
   headline2: const TextStyle(color: Colors.white)
   ),
     colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    accentColor: Colors.black,
    primaryColorDark: Colors.black).copyWith(
    secondary: Colors.black,
    background: const Color.fromRGBO(239, 239, 239, 1),
  ),
  primaryColor: Colors.lightBlue[800],
  tabBarTheme:const TabBarTheme(
  labelColor: Colors.black,
   unselectedLabelColor: Colors.black
   ),
  primaryColorLight: Colors.white,
  backgroundColor: Colors.white,
//colors

);






 final CoR = Colors.blue;
final CoY =  Colors.red;
final CoB = Colors.yellow ;
final CoO = const Color.fromARGB(255, 73, 73, 73);
 
final ColorOther = [
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
CoR, CoY, CoB, CoO, 
];