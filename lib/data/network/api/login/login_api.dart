import 'package:boilerplate_flutter_nafanesia/data/network/api/base_api.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/response_api/response_api.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/service/auth_service.dart';
import 'package:boilerplate_flutter_nafanesia/enums/view_state.dart';
import 'package:boilerplate_flutter_nafanesia/locator.dart';
import 'package:boilerplate_flutter_nafanesia/models/user.dart';
import 'package:flutter/foundation.dart';

class LoginApi extends BaseApi {
  AuthService _authService = locator<AuthService>();

  User user;
  String errorMessage;
  dynamic errorResponse;

  Future login({@required String email, @required String password}) async {
    setState(ViewState.BUSY);
    ResponseApi responseApi =
        await _authService.login(email: email, password: password);

    if (responseApi.data != null) {
      user = User.fromJson(responseApi.data);
    } else {
      errorMessage = responseApi.error.message;
      errorResponse = responseApi.error.data;
    }
    setState(ViewState.IDLE);
  }
}
