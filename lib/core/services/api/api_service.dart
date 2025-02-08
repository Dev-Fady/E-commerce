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

  @POST("favorites")
  Future<dynamic> addOrDeleteFavorites(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> body,
  );

  @GET("favorites")
  Future<dynamic> getFavorites(
    @Header("Authorization") String token,
  );

  @DELETE("favorites/{id}")
  Future<dynamic> deleteFavorait(
    @Header("Authorization") String token,
    @Path("id") int categoryId,
  );

  @POST("carts")
  Future<dynamic> addOrDeleteCart(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> body,
  );

  @GET("carts")
  Future<dynamic> getCart(
    @Header("Authorization") String token,
  );

  @DELETE("carts/{id}")
  Future<dynamic> deleteCart(
    @Header("Authorization") String token,
    @Path("id") int categoryId,
  );

  @PUT("carts/{id}")
  Future<dynamic> updataCart(
    @Header("Authorization") String token,
    @Path("id") int categoryId,
    @Body() Map<String, dynamic> body,
  );

  @GET("home")
  Future<dynamic> getBanner(
    @Header("Authorization") String token,
  );
}
