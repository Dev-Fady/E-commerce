import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/banners/domain/entites/banner_entity.dart';

abstract class BannerRepo {
  Future<Either<Faliure, BannerEntity>> getBanner({required String token});
}
