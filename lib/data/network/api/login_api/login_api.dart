import 'package:boilerplate_flutter_nafanesia/data/local/database.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/api/base_api.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/response_api/response_api.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/service/auth_service.dart';
import 'package:boilerplate_flutter_nafanesia/enums/view_state.dart';
import 'package:boilerplate_flutter_nafanesia/locator.dart';
import 'package:boilerplate_flutter_nafanesia/models/user.dart';
import 'package:flutter/foundation.dart';

class LoginApi extends BaseApi {
  AuthService _authService = locator<AuthService>();
  Sqlite _sqlite = locator<Sqlite>();

  User user;
  String errorMessage;
  dynamic errorResponse;

  Future login({@required String email, @required String password}) async {
    setState(ViewState.BUSY);
    ResponseApi responseApi =
        await _authService.login(email: email, password: password);

    if (responseApi.data != null) {
      user = User.fromJson(responseApi.data);
      //add to stream
      _sqlite.addUser(user);
      //insert to local
      await _sqlite.insertUser(user);
    } else {
      errorMessage = responseApi.error.message;
      errorResponse = responseApi.error.data;
    }
    setState(ViewState.IDLE);
  }
}
