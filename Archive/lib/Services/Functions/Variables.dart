// ignore_for_file: file_names, non_constant_identifier_names
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


String StateUserLogin = '';

final  List<Map<String, dynamic>> cityValue = [
{'value': 'Erbil'.tr,    'label': 'Erbil'.tr},
{'value': 'Al Anbar'.tr, 'label': 'Al Anbar'.tr},
{'value': 'Babylon'.tr, 'label': 'Babylon'.tr},
{'value': 'Baghdad'.tr, 'label': 'Baghdad'.tr},
{'value': 'Basra'.tr,   'label': 'Basra'.tr},
{'value': 'Halabja'.tr, 'label': 'Halabja'.tr},
{'value': 'Duhok'.tr,        'label': 'Duhok'.tr},
{'value': 'Al-Qādisiyyah'.tr,  'label': 'Al-Qādisiyyah'.tr},
{'value': 'Diyala'.tr,'label': 'Diyala'.tr},
{'value': 'Dhi Qar'.tr,'label': 'Dhi Qar'.tr},
{'value': 'Sulaymaniyah'.tr,'label': 'Sulaymaniyah'.tr},
{'value': 'Kirkuk'.tr,'label': 'Kirkuk'.tr},
{'value': 'Karbala'.tr,'label': 'Karbala'.tr},
{'value': 'Muthanna'.tr,'label': 'Muthanna'.tr},
{'value': 'Maysan'.tr,'label': 'Maysan'.tr},
{'value': 'Najaf'.tr,'label': 'Najaf'.tr},
{'value': 'Nineveh'.tr,'label': 'Nineveh'.tr},
{'value': 'Wasit'.tr,'label': 'Wasit'.tr},
{'value': 'Saladin'.tr,'label': 'Saladin'.tr},
];


final  List<Map<String, dynamic>> YearList = [
{'value': '1950', 'label': '1950'},{'value': '1951', 'label': '1951'},{'value': '1952', 'label': '1952'},{'value': '1953', 'label': '1953'},{'value': '1954', 'label': '1954'},{'value': '1955', 'label': '1955'},{'value': '1956', 'label': '1956'},{'value': '1957', 'label': '1957'},{'value': '1958', 'label': '1958'},{'value': '1959', 'label': '1959'},{'value': '1960', 'label': '1960'},{'value': '1961', 'label': '1961'},{'value': '1962', 'label': '1962'},{'value': '1963', 'label': '1963'},{'value': '1964', 'label': '1964'},{'value': '1965', 'label': '1965'},{'value': '1966', 'label': '1966'},{'value': '1967', 'label': '1967'},{'value': '1968', 'label': '1968'},{'value': '1969', 'label': '1969'},{'value': '1970', 'label': '1970'},{'value': '1971', 'label': '1971'},{'value': '1972', 'label': '1972'},{'value': '1973', 'label': '1973'},{'value': '1974', 'label': '1974'},{'value': '1975', 'label': '1975'},{'value': '1976', 'label': '1976'},{'value': '1977', 'label': '1977'},{'value': '1978', 'label': '1978'},{'value': '1979', 'label': '1979'},{'value': '1980', 'label': '1980'},{'value': '1981', 'label': '1981'},{'value': '1982', 'label': '1982'},{'value': '1983', 'label': '1983'},{'value': '1984', 'label': '1984'},{'value': '1985', 'label': '1985'},{'value': '1986', 'label': '1986'},{'value': '1987', 'label': '1987'},{'value': '1988', 'label': '1988'},{'value': '1989', 'label': '1989'},{'value': '1990', 'label': '1990'},{'value': '1991', 'label': '1991'},{'value': '1992', 'label': '1992'},{'value': '1993', 'label': '1993'},{'value': '1994', 'label': '1994'},{'value': '1995', 'label': '1995'},{'value': '1996', 'label': '1996'},{'value': '1997', 'label': '1997'},{'value': '1998', 'label': '1998'},{'value': '1999', 'label': '1999'},{'value': '2000', 'label': '2000'},{'value': '2001', 'label': '2001'},{'value': '2002', 'label': '2002'},{'value': '2003', 'label': '2003'},{'value': '2004', 'label': '2004'},{'value': '2005', 'label': '2005'},{'value': '2006', 'label': '2006'},{'value': '2007', 'label': '2007'},{'value': '2008', 'label': '2008'},{'value': '2009', 'label': '2009'},{'value': '2010', 'label': '2010'},{'value': '2011', 'label': '2011'},{'value': '2012', 'label': '2012'},{'value': '2013', 'label': '2013'},{'value': '2014', 'label': '2014'},{'value': '2015', 'label': '2015'},{'value': '2016', 'label': '2016'},{'value': '2017', 'label': '2017'},{'value': '2018', 'label': '2018'},{'value': '2019', 'label': '2019'},{'value': '2020', 'label': '2020'},{'value': '2021', 'label': '2021'},{'value': '2022', 'label': '2022'},{'value': '2023', 'label': '2023'},{'value': '2024', 'label': '2024'},{'value': '2025', 'label': '2025'},
];


 
//GetLang ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GetAutoSizeText(index, color, size, font) {
  double R = 0;
  R += size;
  return AutoSizeText(
    index,
    style: TextStyle(fontFamily: font, color: color, fontSize: R),
    minFontSize: 11,
    maxFontSize: 16,
    maxLines: 4,
    overflow: TextOverflow.ellipsis,
  );
}

final List number =[
1,2,3,4,5,6,7,8  
];

final List Title =[
'الاول الابتدائي',
'الثاني الابتدائي',
'الثالث الابتدائي',
'الرابع الابتدائي',
'الخامس الابتدائي',
'السادس الابتدائي',
'الاول المتوسط',
'الثاني المتوسط',
];


//vars shadows ---------------------
final shadowDark =
    BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 15.0);
final shadowWhite =
    BoxShadow(color: Colors.grey.withOpacity(.3), blurRadius: 15.0);
//vars shadows ---------------------



//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Gradient Color ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
const cB = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color.fromRGBO(61, 147, 221, 1), Color.fromRGBO(122, 191, 249, 1)],
);
const cR = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(255, 91, 126, 1),
    Color.fromRGBO(224, 50, 104, 1),
  ],
);
const cY = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(254, 181, 70, 1),
    Color.fromRGBO(244, 166, 64, 1),
  ],
);
const cG = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(91, 91, 91, 1),
    Color.fromRGBO(182, 182, 182, 1),
  ],
);
final list = [
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
 cB, cR, cY, cG,
];

 
//Svg Icons

 

 // Language Verification -------------------------------------
updateLanguage(Locale locale) {
  Get.back();
  Get.updateLocale(locale);
}
// Language Verification -------------------------------------
  

 final RxBool isLightTheme = false.obs;
 late bool LangSet = false;
 Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
 
getThemeStatus() async {
var _isLight = _prefs.then((SharedPreferences prefs) {
return prefs.getBool('theme') ?? true;}).obs;
isLightTheme.value = (await _isLight.value);
Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
}


loadCounter() async {
final prefs = await SharedPreferences.getInstance();
var o = (prefs.getInt('counter') ?? 0);

if (o == 1) {updateLanguage(const Locale('ar', 'AR'));
LangSet = true;
}
if (o == 2) {updateLanguage(const Locale('en', 'US'));
LangSet = false;
}
}