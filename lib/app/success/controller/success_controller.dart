import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/dialog_message.dart';

class SuccessController extends GetxController {
  var isSuccess = false.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), () {
      // deleayed code here
      isSuccess.value = true;
      DialogMessage(
        image: Image.asset(
          'assets/images/Tick.png',
          height: 50,
          width: 50,
        ),
        message: 'Data Berhasil Dibuat',
        onConfirm: () => Get.back(),
      ).show();
    });
    super.onInit();
  }
}
