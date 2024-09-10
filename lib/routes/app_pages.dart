import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondoli_test/app/app.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.FORM_PAGE;

  static final routes = [
    GetPage(
      name: Routes.FORM_PAGE,
      page: () => const FormPage(),
      binding: FormBinding(),
      transition: Transition.rightToLeftWithFade,
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: Routes.SUCCESS_PAGE,
      page: () => const SuccessPage(),
      binding: SuccessBinding(),
      transition: Transition.rightToLeftWithFade,
      curve: Curves.fastOutSlowIn,
    ),
  ];
}
