import 'package:flutter/foundation.dart';

class DataExceptions {
  String message;
  bool isResponse;
  dynamic data;

  DataExceptions(
      {@required this.message, @required this.isResponse, @required this.data});
}
