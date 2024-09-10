import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondoli_test/api/response/response.dart';

class RestAPI {
  final _getConnect = GetConnect();

  /// ==================== Method GET ==================== //
  Future<ResponseData?> get({required String url, Duration? timeout}) async {
    late ResponseData? responseJson;

    timeout ??= const Duration(minutes: 5);
    _getConnect.httpClient.timeout = timeout;

    try {
      var resp = await _getConnect.get(url);
      debugPrint("Response $url --> ${resp.body}");
      responseJson = ResponseProvider.parse(resp);
    } catch (err) {
      debugPrint("Response error $url --> $err");
      responseJson = ResponseError.defaultError();
    }

    return responseJson;
  }
}
