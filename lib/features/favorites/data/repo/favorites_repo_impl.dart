import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/favorites/data/models/add_or_delete_favoraite_model.dart';
import 'package:e_commerce/features/favorites/data/models/delete_favorite_model.dart';
import 'package:e_commerce/features/favorites/data/models/get_favorites_model.dart';
import 'package:e_commerce/features/favorites/domain/entites/add_or_delete_favoraite_entity.dart';
import 'package:e_commerce/features/favorites/domain/entites/delete_favoraite_Entitty.dart';
import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
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

  @override
  Future<Either<Faliure, List<GetFavoritesEntity>>> getFavoritesEntity(
      {required String token}) async {
    try {
      final data = await apiService.getFavorites(token);
      log('API Response: $data');

      final List<dynamic> results = data['data']['data'];

      final products =
          results.map((item) => DataPro.fromJson(item)).toList();

      return Right(products);
    } catch (e) {
      log('Exception in GetFavoritesEntity: $e');
      throw Left(CustomException(message: 'حدث خطأ أثناء طلب البيانات.'));
    }
  }

  @override
  Future<Either<Faliure, DeleteFavoraiteEntitty>> deleteFavorite({required String token, required int productId}) async{
    try {
      final response = await apiService.deleteFavorait(token, productId);
      final deleteFavoriteModel = DeleteFavoriteModel.fromJson(response);
      final deleteFavoriteEntity = deleteFavoriteModel.toEntity();
      return Right(deleteFavoriteEntity);
    } catch (e) {
      log('Exception in deleteFavorite: $e');
      return Left(ServerFaliure("حدث خطأ ما. الرجا�� المحاولة مرة ا��خرى. "));
    }
  }
}
