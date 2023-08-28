import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api_Dio {
  Dio _dio = Dio();

  Api_Dio() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    _dio.interceptors.add(PrettyDioLogger());
  }
  Dio get sendRequest => _dio;
}
