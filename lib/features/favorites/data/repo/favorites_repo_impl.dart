import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/favorites/data/models/add_or_delete_favoraite_model.dart';
import 'package:e_commerce/features/favorites/domain/entites/add_or_delete_favoraite_entity.dart';
import 'package:e_commerce/features/favorites/domain/repo/favorites_repo.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final ApiService apiService;

  FavoritesRepoImpl({required this.apiService});
  @override
  Future<Either<Faliure, AddOrDeleteFavoraiteEntity>> addOrRemoveFavorait(
      {required String token, required int productId}) async {
    try {
      final response = await apiService.addOrDeleteFavorites(
        token,
        {
          'product_id': productId,
        },
      );
      final addOrDeleteFavoriteModel =
          AddOrDeleteFavoraiteModel.fromJson(response);
      final addOrDeleteFavoriteEntity = addOrDeleteFavoriteModel.toEntity();

      return Right(addOrDeleteFavoriteEntity);
    } catch (e) {
      log('Exception in addOrRemoveFavorait: $e');
      return Left(ServerFaliure(" حدث خطأ ما. الرجاء المحاولة مرة أخرى. "));
    }
  }
}
