import 'response_model.dart';

class ResponseError {
  static ResponseData defaultError() {
    return ResponseData(
      statusCode: 500,
      message: "Terjadi Kesalahan, silahkan coba lagi.",
    );
  }
}
