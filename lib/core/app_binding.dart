
import 'package:get/get.dart';


import '../service/http_service_impl.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HttpServiceImpl());

  }
}
