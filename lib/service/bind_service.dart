
import 'package:get/get.dart';
import 'package:getx_example/controller/home_controller.dart';


class BindService implements Bindings {

  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}