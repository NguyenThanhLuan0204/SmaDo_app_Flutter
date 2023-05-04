import 'package:firebase_core/firebase_core.dart';
import 'package:fit/Screen/HomePage.dart';
import 'package:fit/Screen/Login/Screens/Welcome/welcome_screen.dart';
import 'package:fit/Screen/Menu/NotificationManagerScreen.dart';
import 'package:fit/appLanguage/constanst.dart';
import 'package:fit/appLanguage/local_storage.dart';
import 'package:fit/appLanguage/stranslation_service.dart';
import 'package:fit/testMessage.dart';
import 'package:fit/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
Future<void> main() async {
//   await LocalStorage.init();
//   WidgetsFlutterBinding.ensureInitialized();
//  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
// // await Firebase.initializeApp();
// // await FirebaseMessaging.instance.getInitialMessage();
//     runApp(GetMaterialApp(
//         translations: TranslationService(),
//         locale: TranslationService.locale,
//         fallbackLocale: TranslationService.fallbackLocale,
//         home: MyApp(), debugShowCheckedModeBanner: false));


  await GetStorage.init('MyStorage');
  final box = GetStorage('MyStorage');
  String? mode = box.read(THEME_KEY);
  print('mode is $mode');
  bool isLightMode = (mode != null && mode == "light");
  print('is dark mode $isLightMode');
  await LocalStorage.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //HttpOverrides.global = MyHttpOverrides();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: Routes.SPLASH,
      themeMode: isLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      defaultTransition: Transition.fade,
      //initialBinding: SplashBinding(),
      translations: TranslationService(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      //getPages: AppPages.pages,
      home: MyApp(),
      //KHÔNG ĐƯỢC SỬA Ở FILE NÀY KHI CHƯA CÓ Ý KIẾN CỦA LEADER
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
  }
}
