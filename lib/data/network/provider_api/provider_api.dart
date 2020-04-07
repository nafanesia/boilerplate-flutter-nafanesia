import 'package:boilerplate_flutter_nafanesia/data/network/endpoint.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/interceptor/dio_connectivity_request_retrier.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/interceptor/retry_interceptor.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class ProviderApi {
  //options
  static BaseOptions _options = BaseOptions(
    baseUrl: Endpoint.getBaseUrl(),
    connectTimeout: 10000,
    receiveTimeout: 10000,
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
