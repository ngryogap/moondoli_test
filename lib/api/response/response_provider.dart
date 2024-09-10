import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondoli_test/api/response/response.dart';

class ResponseProvider extends GetConnect {
  static ResponseData? parse(Response response) {
    try {
      var responseBody = json.decode(response.bodyString!);
      switch (response.statusCode) {
        case 200:
          return ResponseData.fromJson(responseBody);

        default:
          return ResponseData(
            statusCode: responseBody['status_code'],
            message: responseBody['message'] ??
                "Terjadi Kesalahan, silahkan coba lagi.",
          );
      }
    } catch (error) {
      debugPrint("ResponseProvider Error --> $error");
      return ResponseError.defaultError();
    }
  }
}
