import 'package:dio/dio.dart';
import 'package:e_commerce/features/auth/data/model/login_request.dart';
import 'package:e_commerce/features/auth/data/model/user_model_api.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://student.valuxapps.com/api/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("categories")
  Future<dynamic> getCategories();

  @POST("register")
  Future<dynamic> register(@Body() UserModelApi userModelApi);

  @POST("login")
  Future<dynamic> login(
    @Body() LoginRequest request,
  );

  @GET("profile")
  Future<dynamic> getProfile(@Header("Authorization") String token);

  @POST("logout")
  Future<dynamic> logout(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> body,
  );


  @GET("categories/{id}")
  Future<dynamic> categoryDetails(
    @Header("Authorization") String token,
    @Path("id") int categoryId,
  );
}
