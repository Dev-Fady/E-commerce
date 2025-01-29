import 'package:dio/dio.dart';
import 'package:e_commerce/core/services/api/api_comsumer.dart';
import 'package:e_commerce/core/services/api/end_ponits.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPonits.baseUrl;
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  //! DELETE
  @override
  Future delete(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFromData = false}) async {
    try {
      final response = await dio.delete(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception("DELETE request failed: $e");
    }
  }

  //! GET
  @override
  Future<Map<String, dynamic>> get(String path, {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw Exception("GET request failed: $e");
    }
  }

  //! POST
  @override
  Future<Map<String, dynamic>> post(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception("POST request failed: $e");
    }
  }

  //! PATCH
  @override
  Future<Map<String, dynamic>> patch(String path, {data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception("PATCH request failed: $e");
    }
  }
}
