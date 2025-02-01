import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/profile/data/model/profile_model.dart';
import 'package:e_commerce/features/profile/domian/entites/profile_entity.dart';
import 'package:e_commerce/features/profile/domian/repo/profile_rope.dart';

class ProfileRepoImpl extends ProfileRope {
  final ApiService apiService;

  ProfileRepoImpl({required this.apiService});
  @override
  Future<Either<Faliure, ProfileEntity>> getProfile(
      {required String token}) async {
    try {
      final response = await apiService.getProfile(token);
      return Right(ProfileModel.fromJson(response));
    } catch (error) {
      log('Exception in getProfile: $error');
      return Left(ServerFaliure(" حدث خطأ ما. الرجاء المحاولة مرة أخرى. "));
    }
  }
}
