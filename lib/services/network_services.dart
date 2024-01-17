import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Client {
  Dio init() {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      logPrint: (object) => log(object.toString()),
    ));
    dio.options.baseUrl = "http://sinagaemas.primasoft.co.id/api";
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.sendTimeout = const Duration(minutes: 2);
    dio.options.receiveTimeout = const Duration(minutes: 2);
    dio.options.connectTimeout = const Duration(minutes: 2);

    return dio;
  }
}

final client = Client().init();
