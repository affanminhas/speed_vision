import 'package:get/get.dart';
import 'package:speed_vision/controllers/auth_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}
