import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondoli_test/widget/widget.dart';

import '../form.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(10, 40, 15, 0),
          child: Row(
            children: [
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 25,
                  )),
              Image.asset(
                'assets/images/Progress.png',
                width: Get.width * 0.80,
              )
            ],
          ),
        ),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends GetView<FormController> {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Konfirmasi Data dan\nLengkapi Profil',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'HelveticaNeue',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Cek ulang data pribadi kamu dan lengkapi profil sepenuhnya.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'HelveticaNeue',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const PersonalDataForm(),
            const SizedBox(
              height: 30,
            ),
            ButtonRounded(
              text: 'Lanjutkan',
              onClick: () => controller.onClickNext(),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
