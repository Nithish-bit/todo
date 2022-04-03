import 'package:get/get.dart';

import 'package:todo/app/modules/welcome/controllers/welcome_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(
      () => WelcomeController(),
    );
  }
}
