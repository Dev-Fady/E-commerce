import 'package:e_commerce/core/cache/cache_helper.dart';

class TokenStorage {
  static const String _tokenKey = "auth_token";

  Future<void> saveToken(String token) async {
    await CacheHelper().saveData(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await CacheHelper().getData(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await CacheHelper().removeData(key: _tokenKey);
  }
}
