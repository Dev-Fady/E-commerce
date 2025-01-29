// import 'package:the_rich_and_morty/core/cache/cache.dart';
// import 'package:the_rich_and_morty/core/networking/api/end_ponits.dart';
// import 'package:dio/dio.dart';

// class ApiInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     options.headers[ApiKey.token] =
//         CacheHelper().getData(key: ApiKey.token) != null
//             ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
//             : null;
//     super.onRequest(options, handler);
//   }
// }
class ApiInterceptor 
{}