import 'package:get/get.dart';

import '../controllers/ar_controller.dart';

class ArBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArController>(
      () => ArController(),
    );
  }
}
