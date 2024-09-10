import 'package:get/get.dart';
import 'package:mondoli_test/app/form/controller/form_controller.dart';

class FormBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FormController());
  }
}
