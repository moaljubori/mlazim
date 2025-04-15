//Code By Hussein Jabbar 2022-2023[]
//Import Class Code
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:malazim_iq/Views/home.dart';
import 'Authentication/CreateAccount.dart';
import 'Authentication/ForgotPassword.dart';
import 'Authentication/Login.dart';
import 'Services/Thems/Theme.dart';
import 'Services/Thems/Translations.dart';
import 'Splash.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

//android ----------------------------------------
//import 'package:google_mobile_ads/google_mobile_ads.dart';

//ios ---------------------------------------------
import 'package:admob_flutter/admob_flutter.dart';

//Run App -----------------------------------
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();

  //ios ^^^^^^^^^^^^^^
  Admob.initialize();

  //android ^^^^^^^^^^^^^^
  //MobileAds.instance.initialize();
  runApp(MyApp(status: status));
}
//Run App -----------------------------------

//Class Home Run App Start ^^^^^^^^^^^^^^^^^^^^^^^^^^
class MyApp extends StatelessWidget {
  final TrackingStatus status;
  const MyApp({required this.status});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final String? statusText;

    switch (status) {
      case TrackingStatus.authorized:
        statusText = 'Tracking Status Authorized';
        break;
      case TrackingStatus.notDetermined:
        statusText = 'Tracking Status notDetermined';
        break;
      case TrackingStatus.restricted:
        statusText = 'Tracking Status restricted';
        break;
      case TrackingStatus.denied:
        statusText = 'Tracking Status denied';
        break;
      case TrackingStatus.notSupported:
        statusText = 'Tracking Status notSupported';
        break;
      default:
        statusText = 'You should not see this...';
    }
    //Get Return App ^^^^^^^^^^^^^^^^^^^^^^^^^^
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ملازم العراق',
      theme: ThemeLight,
      darkTheme: ThemeDark,
      themeMode: ThemeMode.light,
      translations: Lang(),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: const Locale('ar', 'AR'),
      initialRoute: '/',
      routes: {
        '/login': (context) => const Login(),
        '/': (context) => const Splash(),
        '/Home': (context) => const HomePage(),
        '/CreateAccount': (context) => const CreateAccount(),
        '/ForgotPassword': (context) => const ForgotPassword(),
      },
    );
    //Get Return App ^^^^^^^^^^^^^^^^^^^^^^^^^^
  }
}
//Class Home Run App Start ^^^^^^^^^^^^^^^^^^^^^^^^^^
