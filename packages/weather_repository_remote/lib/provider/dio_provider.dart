import 'package:dio/dio.dart';

Dio providerDio({List<Interceptor>? interceptors, required String baseUrl}) {
  final baseOptions = BaseOptions(baseUrl: baseUrl);
  final dio = Dio(baseOptions);
  if (interceptors != null && interceptors.isNotEmpty) {
    dio.interceptors.addAll(interceptors);
  }
  return dio;
}
