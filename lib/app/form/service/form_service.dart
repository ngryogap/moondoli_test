import 'package:flutter/material.dart';
import 'package:mondoli_test/api/rest_api.dart';

import '../model/model.dart';

class FormService {
  static Future<List<CountriesModel>?> getCountries() async {
    var response = await RestAPI().get(
      url: 'https://countriesnow.space/api/v0.1/countries/currency',
    );
    if (response == null) {
      return null;
    }
    try {
      if (response.data!.isNotEmpty) {
        return countriesModelFromJson(response.data!);
      } else {
        debugPrint('GAGAL');
      }
    } catch (e) {
      debugPrint("error catch --> $e");
    }

    return null;
  }
}
