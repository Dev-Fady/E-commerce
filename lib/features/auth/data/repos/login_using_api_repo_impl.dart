import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/auth/data/model/login_using_api_model.dart';
import 'package:e_commerce/features/auth/domain/entites/login_using_api_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/login_using_api_repo.dart';

import '../model/login_request.dart';

class LoginUsingApiRepoImpl extends LoginUsingApiRepo {
  final ApiService apiService;

  LoginUsingApiRepoImpl({required this.apiService});
  @override
  Future<Either<Faliure, LoginUsingApiEntity>> Login(
      {required LoginRequest loginRequest}) async {
    try {
      final response = await apiService.login(loginRequest);
      final registerEntity = LoginUsingApiModel.fromJson(response);

      return Right(registerEntity);
    } catch (e) {
      log('Exception in register: $e');
      return Left(ServerFaliure(" حدث خطأ ما. الرجاء المحاولة مرة أخرى. "));
    }
  }
}
