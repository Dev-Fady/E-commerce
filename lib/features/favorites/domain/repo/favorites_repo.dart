import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/favorites/domain/entites/add_or_delete_favoraite_entity.dart';
import 'package:e_commerce/features/favorites/domain/entites/delete_favoraite_Entitty.dart';
import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';

abstract class FavoritesRepo {
  Future<Either<Faliure, AddOrDeleteFavoraiteEntity>> addOrRemoveFavorait(
      {required String token, required int productId});

  Future<Either<Faliure, DeleteFavoraiteEntitty>> deleteFavorite(
      {required String token, required int productId});

  Future<Either<Faliure, List<GetFavoritesEntity>>> getFavoritesEntity(
      {required String token});
}
