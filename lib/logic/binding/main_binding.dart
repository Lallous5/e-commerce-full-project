import 'package:ecommerce_using_getx/logic/controllers/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainController());
  }
}
