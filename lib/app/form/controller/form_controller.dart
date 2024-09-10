import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondoli_test/app/form/service/service.dart';
import 'package:mondoli_test/routes/app_pages.dart';

import '../form.dart';

class FormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingControllerFirstName =
      TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
  TextEditingController textEditingControllerDate = TextEditingController();
  TextEditingController textEditingControllerPhone = TextEditingController();
  TextEditingController textEditingControllerCountry = TextEditingController();
  TextEditingController textEditingControllerProvince = TextEditingController();
  TextEditingController textEditingControllerPosCode = TextEditingController();
  TextEditingController textEditingControllerAddress = TextEditingController();
  var listCountries = <CountriesModel>[].obs;
  var listNegara = <String>[].obs;
  var countrieSelected = Rxn<CountriesModel>();
  var selectedItem = ''.obs;

  @override
  void onInit() {
    selectedItem.value = '+62';
    getCountries();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getCountries() async {
    var response = await FormService.getCountries();
    debugPrint('response: $response');
    listCountries.value = response!;
    for (var element in listCountries) {
      listNegara.add(element.name!);
    }
  }

  onClickCountry() {
    Get.bottomSheet(
      BottomSheetSelectCountryView(
        items: listCountries,
        onClick: (items) => onCountrySelected(items),
      ),
      backgroundColor: Colors.transparent,
      enableDrag: true,
    );
  }

  onChangePhoneCode(String value) {
    selectedItem.value = value;
  }

  onCountrySelected(CountriesModel value) {
    countrieSelected.value = value;
    textEditingControllerCountry.text = countrieSelected.value!.name!;
    Get.back();
  }

  onClickProvince() {
    Get.bottomSheet(
      BottomSheetSelectCountryView(
        items: listCountries,
        onClick: (items) => onProvinceSelected(items),
      ),
      backgroundColor: Colors.transparent,
      enableDrag: true,
    );
  }

  onProvinceSelected(CountriesModel value) {
    countrieSelected.value = value;
    textEditingControllerProvince.text = countrieSelected.value!.name!;
    Get.back();
  }

  onClickPosCode() {
    Get.bottomSheet(
      BottomSheetSelectCountryView(
        items: listCountries,
        onClick: (items) => onPosCodeSelected(items),
      ),
      backgroundColor: Colors.transparent,
      enableDrag: true,
    );
  }

  onPosCodeSelected(CountriesModel value) {
    countrieSelected.value = value;
    textEditingControllerPosCode.text = countrieSelected.value!.name!;
    Get.back();
  }

  onClickNext() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(Routes.SUCCESS_PAGE);
    }
  }
}
