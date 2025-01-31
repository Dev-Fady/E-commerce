import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/auth/data/model/login_request.dart';
import 'package:e_commerce/features/auth/domain/entites/login_using_api_entity.dart';

import '../../../../core/errors/faliures.dart';

abstract class LoginUsingApiRepo {
  Future<Either<Faliure, LoginUsingApiEntity>> Login(
      {required LoginRequest loginRequest});
}
