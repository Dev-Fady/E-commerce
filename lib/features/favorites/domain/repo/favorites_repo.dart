import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/favorites/domain/entites/add_or_delete_favoraite_entity.dart';

abstract class FavoritesRepo {
  Future<Either<Faliure, AddOrDeleteFavoraiteEntity>> addOrRemoveFavorait(
      {required String token, required int productId});
}
