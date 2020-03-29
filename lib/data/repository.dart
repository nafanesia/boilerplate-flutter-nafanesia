import 'package:boilerplate_flutter_nafanesia/data/network/provider/provider_api.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/results/result.dart';
import 'package:boilerplate_flutter_nafanesia/models/login_model.dart';

class Repository {
  ProviderApi _provider = ProviderApi();

  Future<Result> login({String email, String password}) =>
      _provider.login(email: email, password: password);
}
