import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/profile/data/model/logout_model.dart';
import 'package:e_commerce/features/profile/domian/entites/profile_entity.dart';

abstract class ProfileRope {
  Future<Either<Faliure, ProfileEntity>> getProfile({required String token});

  Future<Either<Faliure, LogoutModel>> logout({required String token});
}
