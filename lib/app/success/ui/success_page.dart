import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../success.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: _Body(),
    );
  }
}

class _Body extends GetView<SuccessController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.close)),
            ),
            const SizedBox(
              height: 50,
            ),
            controller.isSuccess.value
                ? Container()
                : Lottie.asset('assets/lottie/circle_arrow_up_bounce.json'),
          ],
        ),
      ),
    );
  }
}
