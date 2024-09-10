import 'package:get/get.dart';

import '../success.dart';

class SuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SuccessController());
  }
}
