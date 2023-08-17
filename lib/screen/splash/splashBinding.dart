import 'package:basic_demo/screen/splash/splashController.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
  
}