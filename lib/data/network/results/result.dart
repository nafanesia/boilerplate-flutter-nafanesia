import 'package:boilerplate_flutter_nafanesia/data/network/exceptions/data_exception.dart';
import 'package:flutter/foundation.dart';

class Result with ChangeNotifier {
  bool isLoading = false;
  dynamic data;
  DataExceptions error;

  set setIsLoading(bool b) {
    isLoading = b;
    notifyListeners();
  }

  set setData(dynamic newValue) {
    data = newValue;
    notifyListeners();
  }

  set setError(DataExceptions newValue) {
    error = newValue;
    notifyListeners();
  }
}
