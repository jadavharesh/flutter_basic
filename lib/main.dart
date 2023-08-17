import 'package:basic_demo/screen/splash/splashBinding.dart';
import 'package:basic_demo/screen/splash/splashView.dart';
import 'package:basic_demo/utility/ColorCode.dart';
import 'package:basic_demo/utility/RouteInfo.dart';
import 'package:basic_demo/utility/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';

import 'lang/translation_service.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Utils.getColor(ColorCode.blue)));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              enableLog: true,
              navigatorKey: NavigationService.navigatorKey,
              locale: const Locale('en', 'US'),
              translations: TranslationService(),
              getPages: [
                GetPage(name: RouteInfo.splashscreen, page: () => SplashScreen(), binding: SplashBinding()),
              ],
              initialRoute: RouteInfo.splashscreen);
        });
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

