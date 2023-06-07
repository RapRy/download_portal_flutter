import "package:dio/dio.dart";
import "package:download_portal/constants/exception.dart";
import "package:download_portal/provider/preference/preference_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dio_Config = Provider((ref) {
  final PrefProvider = ref.watch(preferenceProvider);

  final dioConfig = Dio(BaseOptions(
    baseUrl: "https://dl-portal.onrender.com",
    // connectTimeout: const Duration(seconds: 5),
    // receiveTimeout: const Duration(seconds: 5)
  ))
    ..interceptors.addAll([
      DioInterceptors(prefProvider: PrefProvider),
      PrettyDioLogger(
        // requestHeader: true,
        responseBody: false,
      ),
    ]);
  return dioConfig;
});

class DioInterceptors extends Interceptor {
  DioInterceptors({this.prefProvider});

  final prefProvider;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = prefProvider.getUserToken();

    options.headers['Authorization'] = "Bearer $token";

    return handler.next(options);
  }
}
