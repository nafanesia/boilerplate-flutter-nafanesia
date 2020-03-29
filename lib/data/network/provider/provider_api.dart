import 'package:boilerplate_flutter_nafanesia/data/network/endpoint/endpoint.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/exceptions/dio_exceptions.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/interceptor/dio_connectivity_request_retrier.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/interceptor/retry_interceptor.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/results/result.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class ProviderApi {
  static final String _baseUrlDev =
      "https://my-json-server.typicode.com/nafanesia/fake-api";
  static final String _baseUrlStaging =
      "https://my-json-server.typicode.com/nafanesia/fake-api";
  static final String _baseUrlProd =
      "https://my-json-server.typicode.com/nafanesia/fake-api";

  //options
  static BaseOptions _options = BaseOptions(
    baseUrl: _baseUrlDev,
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );

  Dio _dio;

  ProviderApi() {
    _dio = Dio(_options);
    _dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: Dio(),
          connectivity: Connectivity(),
        ),
      ),
    );
  }

  Future<Result> login({String email, String password}) async {
//    try {
//      Response response = await _dio
//          .post(Endpoint.login, data: {"email": email, "password": password});
//      return Result(data: response.data);
//    } on DioError catch (e) {
//      return Result(error: DioExceptions(e).getExceptions());
//    }
  }
}
