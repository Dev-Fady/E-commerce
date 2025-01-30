import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/auth/data/model/user_model_api.dart';
import 'package:e_commerce/features/auth/domain/entites/register_using_api_entity.dart';

abstract class RegisterUsingApiRepo {
  Future<Either<Faliure, RegisterUsingApiEntity>> register(UserModelApi userModelApi);
}
