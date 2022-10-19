import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(service: Get.find()), fenix: true);
  }
}
