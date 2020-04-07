import 'package:boilerplate_flutter_nafanesia/utils/dio/dio_exceptions.dart';

class ResponseApi {
  dynamic data;
  DioExceptions error;

  void setData(dynamic newValue) {
    data = newValue;
  }

  void setError(DioExceptions newValue) {
    error = newValue;
  }
}
