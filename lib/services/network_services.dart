import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinagaemas/services/di_service.dart';

final HttpService httpService = locator<HttpService>();
final apiService = httpService._dio;

class HttpService {
  static final HttpService _instance = HttpService._internal();

  factory HttpService() {
    return _instance;
  }

  HttpService._internal();

  final Dio _dio = Dio();
  // ..interceptors.add(PrettyDioLogger(
  //   requestHeader: true,
  //   requestBody: true,
  //   responseBody: true,
  //   responseHeader: false,
  //   error: true,
  //   compact: true,
  //   maxWidth: 120,
  //   logPrint: (object) => debugPrint(object.toString()),
  // )
  //);
  String _baseUrl = "http://sinagaemas.primasoft.co.id/api";

  String get baseUrl => _baseUrl;

  Dio get dio => _dio;

  void setBaseUrl(String newBaseUrl) {
    _baseUrl = newBaseUrl;
    _dio.options = BaseOptions(baseUrl: _baseUrl);

    // Save baseUrl using SharedPreferences
    saveBaseUrlToSharedPreferences(_baseUrl);
  }

  void setLanguage(String language) {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Localization': language,
    };
  }

  void setBearer(String bearer) {
    _dio.options.headers = {'Authorization': 'Bearer $bearer'};
  }

  Future<void> saveBaseUrlToSharedPreferences(String baseUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('baseUrl', baseUrl);
  }

  Future<String> getBaseUrlFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('baseUrl') ??
        "https://cms-grandcempaka2023.kelolain.id/api";
  }
}
