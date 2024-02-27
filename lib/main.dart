import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_tz/presenter/screens/catalog/catalog_page.dart';
import 'package:marketplace_tz/presenter/screens/language/language_screen.dart';
import 'package:marketplace_tz/presenter/screens/location_detail_screen/location_detail_screen.dart';
import 'package:marketplace_tz/presenter/screens/login/login_page.dart';
import 'package:marketplace_tz/presenter/screens/main/main_page.dart';
import 'package:marketplace_tz/presenter/screens/map/map_screen_location.dart';
import 'package:marketplace_tz/presenter/screens/register/register_page.dart';
import 'package:marketplace_tz/presenter/screens/settings/settings_page.dart';
import 'package:marketplace_tz/presenter/screens/splash/splash_page.dart';
import 'package:marketplace_tz/presenter/screens/verification/sms_code_succses.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "splash",
      routes: {
        "splash":(context)=>const SplashPage(),
        "languageScreen": (context) => const LanguageScreen(),
        "mapScreen":(context)=>const MapScreenLocation(),
        "mapdetailScreen":(context)=>const LocationDetailScreen(),
        "main":(context)=> MainPage(street: "",),
        "catalog":(context)=> const CatalogPage(),
        "login":(context)=>const LoginPage(),
        "smsveri":(context)=>SMSSucssesPage( phoneNumber: '',),
        "register":(context)=>const RegisterPage(),
        "settings":(context)=>const SettingsPage(),

      },
    );
  }
}
