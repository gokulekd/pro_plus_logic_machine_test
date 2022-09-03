import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';


class ApiServiceEndPoint {
  final dio = Dio(BaseOptions(responseType: ResponseType.plain));
  Future<Response<dynamic>?> login(credentials) async {

    try {
      final response = await dio.post("https://fakestoreapi.com/auth/login",
          data: credentials);
   
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response<dynamic>?> getProduct() async {
    try {
      final response =
          await dio.get("https://api.escuelajs.co/api/v1/products");
  
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
