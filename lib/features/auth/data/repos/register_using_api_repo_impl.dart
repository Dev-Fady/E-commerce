import 'dart:developer';

import 'package:dartz/dartz.dart';
// import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/auth/data/model/register_using_api_model.dart';
import 'package:e_commerce/features/auth/data/model/user_model_api.dart';
import 'package:e_commerce/features/auth/domain/entites/register_using_api_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/register_using_api_repo.dart';

class RegisterUsingApiRepoImpl extends RegisterUsingApiRepo {
  final ApiService apiService;

  RegisterUsingApiRepoImpl({required this.apiService});

  @override
  Future<Either<Faliure, RegisterUsingApiEntity>> register(
      UserModelApi userModelApi) async {
    try {
      final response = await apiService.register(userModelApi);
      final registerEntity = RegisterUsingApiModel.fromJson(response);

      return Right(registerEntity.data);
    } catch (e) {
      log('Exception in register: $e');
      return Left(ServerFaliure("حدث خطأ أثناء انشاء الحساب."));
    }
  }
}
