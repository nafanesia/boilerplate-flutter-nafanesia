import 'package:boilerplate_flutter_nafanesia/data/network/interceptor/dio_connectivity_request_retrier.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/interceptor/retry_interceptor.dart';
import 'package:boilerplate_flutter_nafanesia/flavor.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class ProviderApi {
  // ignore: missing_return
  static String _getBaseUrl() {
    switch (flavor) {
      case FlavorEnum.DEV:
        return "https://jsonplaceholder.typicode.com";
        break;
      case FlavorEnum.STAG:
        return "https://jsonplaceholder.typicode.com";
        break;
      case FlavorEnum.PROD:
        return "https://jsonplaceholder.typicode.com";
        break;
    }
  }

  //options
  static BaseOptions _options = BaseOptions(
    baseUrl: _getBaseUrl(),
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );

  Dio dio;

  ProviderApi() {
    dio = Dio(_options);
    dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: Dio(),
          connectivity: Connectivity(),
        ),
      ),
    );
  }
}
