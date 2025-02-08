import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/banners/data/models/banner_model.dart';
import 'package:e_commerce/features/banners/domain/entites/banner_entity.dart';
import 'package:e_commerce/features/banners/domain/repo/banner_repo.dart';

class BannerRepoImpl extends BannerRepo {
  final ApiService apiService;

  BannerRepoImpl({required this.apiService});
  @override
  Future<Either<Faliure, BannerEntity>> getBanner(
      {required String token}) async {
    try {
      final response = await apiService.getBanner(token);
      final bannerModel = BannerModel.fromJson(response);
      final bannerEntity = bannerModel.toEntity();
      return Right(bannerEntity);
    } catch (e) {
      log('Exception in getBanner: $e');
      return Left(ServerFaliure("حدث خطأ ما. الرجا�� المحاولة مرة ا��خرى. "));
    }
  }
}
