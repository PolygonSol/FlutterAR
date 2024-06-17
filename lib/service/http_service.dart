import 'package:dio/dio.dart';

abstract class HttpService{
  Future<void> init();
  Future<Response?> getRequest(String url);
  Future<Response?> deleteRequest(String url);
  Future<Response?> postRequest(String url,{Map<String,dynamic> data});
  Future<Response?> postRequestWithFormData(String url,{FormData? data});
  Future<Response?> patchRequest(String url,{FormData data});
}