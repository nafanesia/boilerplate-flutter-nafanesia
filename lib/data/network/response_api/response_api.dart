import 'package:boilerplate_flutter_nafanesia/data/network/exceptions/dio_exceptions.dart';

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
