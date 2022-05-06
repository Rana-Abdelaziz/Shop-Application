import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static late Dio dio;

  static inti() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        // headers: {
        //   'Content-Type': 'application/json',
        //   'lang': 'en',
        //   'Authorization': ''
        // }
      ),
    );
  }

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query, String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token
    };
    return await dio.post(url, queryParameters: query, data: data);
  }
}
