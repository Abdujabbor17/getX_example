
import 'package:get/get.dart';
import 'package:getx_example/controller/starter_controller.dart';
import '../controller/home_controller.dart';
import '../controller/splash_controller.dart';

class DIService {
  static Future<void> init() async {
   // Get.put<HomeController>(HomeController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<StarterController>(() => StarterController(), fenix: true);

  }
}