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
      message = "Connection timeout with server";
      break;
    case DioErrorType.SEND_TIMEOUT:
      message = "Send timeout in connection with server";
      break;
    case DioErrorType.RECEIVE_TIMEOUT:
      message = "Receive timeout in connection with server";
      break;
    case DioErrorType.RESPONSE:
      message = "Response error";
      data = dioError.response.data;
      break;
    case DioErrorType.CANCEL:
      message = "Request to server was cancelled";
      break;
    case DioErrorType.DEFAULT:
      message = "Connection to server failed due to internet connection";
      break;
  }
  return DioExceptions(message, data);
}
