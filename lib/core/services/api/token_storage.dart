import 'package:e_commerce/core/cache/cache_helper.dart';

class TokenStorage {
  static const String _tokenKey = "auth_token";

  Future<void> saveToken(String token) async {
    await CacheHelper().saveData(key: _tokenKey, value: token);
  }

  String getToken() {
    return CacheHelper().getData(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await CacheHelper().removeData(key: _tokenKey);
  }

  static const String _tokenLogin = "login_token";

  Future<void> saveTokenLogin(String token) async {
    await CacheHelper().saveData(key: _tokenLogin, value: token);
  }

  String getTokenLogin() {
    return CacheHelper().getData(key: _tokenLogin);
  }

  Future<void> deleteTokenLogin() async {
    await CacheHelper().removeData(key: _tokenLogin);
  }
}
