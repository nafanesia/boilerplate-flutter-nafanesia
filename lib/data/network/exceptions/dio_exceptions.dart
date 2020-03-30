import 'package:dio/dio.dart';

class DioExceptions {
  String message;
  dynamic data;

  DioExceptions(this.message, this.data);
}

DioExceptions getDioExceptions(dioError) {
  String message;
  dynamic data;

  switch (dioError.type) {
    case DioErrorType.CONNECT_TIMEOUT:
      message = "Connecting timeout";
      break;
    case DioErrorType.SEND_TIMEOUT:
      message = "Sending request timeout";
      break;
    case DioErrorType.RECEIVE_TIMEOUT:
      message = "Receive data timeout";
      break;
    case DioErrorType.RESPONSE:
      message = "Response error";
      data = dioError.response.data;
      break;
    case DioErrorType.CANCEL:
      message = "Request canceled";
      break;
    case DioErrorType.DEFAULT:
      message = "No internet access";
      break;
  }
  return DioExceptions(message, data);
}
