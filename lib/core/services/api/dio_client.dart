import 'package:dio/dio.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';

class DioClient {
  late Dio _dio;
  static const String baseUrl = "https://api.example.com";
  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await TokenStorage().getToken();
        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // هنا ممكن تضيف تجديد التوكين لو الـ API بيدعمها
        }
        return handler.next(e);
      },
    ));
  }

  Dio get dio => _dio;
}
