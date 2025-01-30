import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart'; 

@RestApi(baseUrl: 'https://student.valuxapps.com/api/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("categories")
  Future<dynamic> getCategories(); 

  // @GET("/users/{id}")
  // Future<UserModel> getUser(@Path("id") int id); // جلب مستخدم معين

  // @POST("/users")
  // Future<UserModel> createUser(@Body() UserModel user); // إنشاء مستخدم جديد
}
