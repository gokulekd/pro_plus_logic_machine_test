import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';

class ApiServiceEndPoint {
  final dio = Dio(BaseOptions(
      // baseUrl: "https://api.escuelajs.co/api/v1/",
      responseType: ResponseType.plain));
  Future<Response<dynamic>?> login(credentials) async {
    try {
      final response = await dio.post("https://fakestoreapi.com/auth/login",
          data: jsonEncode(credentials));
      log(response.toString());
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response<dynamic>?> getProduct() async {
    try {
      final response = await dio.get("https://api.escuelajs.co/api/v1/products");
      log(response.toString());
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
