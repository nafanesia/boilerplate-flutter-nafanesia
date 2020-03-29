import 'package:boilerplate_flutter_nafanesia/data/network/exceptions/data_exception.dart';
import 'package:dio/dio.dart';

class DioExceptions {
  DioError dioError;

  DioExceptions(this.dioError);

  DataExceptions getExceptions() {
    String error;
    bool isResponse = false;
    dynamic data;

    switch (dioError.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        error = "Connecting timeout";
        break;
      case DioErrorType.SEND_TIMEOUT:
        error = "Sending request timeout";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        error = "Receive data timeout";
        break;
      case DioErrorType.RESPONSE:
        error = "Response error";
        isResponse = true;
        data = dioError.response.data;
        break;
      case DioErrorType.CANCEL:
        error = "Request canceled";
        break;
      case DioErrorType.DEFAULT:
        error = "No internet access";
        break;
    }

    return DataExceptions(message: error, isResponse: isResponse, data: data);
  }
}
