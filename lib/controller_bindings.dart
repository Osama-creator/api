import 'package:api/controller/user_controller.dart';
import 'package:get/instance_manager.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
  }
}