// import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/favorites/domain/repo/favorites_repo.dart';
import '../../../domain/entites/add_or_delete_favoraite_entity.dart';
part 'add_or_delete_favorites_state.dart';

class AddOrDeleteFavoritesCubit extends Cubit<AddOrDeleteFavoritesState> {
  final FavoritesRepo favoritesRepo;
  final CacheHelper prefs = CacheHelper();

  final Map<int, bool> productFavorites = {};

  AddOrDeleteFavoritesCubit({required this.favoritesRepo})
      : super(AddOrDeleteFavoritesInitial());

  Future<void> addOrRemoveFavorite(int productId) async {
    emit(AddOrDeleteFavoritesLoading());

    final result = await favoritesRepo.addOrRemoveFavorait(
      token: TokenStorage().getTokenLogin(),
      productId: productId,
    );

    result.fold(
      (failure) {
        emit(AddOrDeleteFavoritesFailure(error: failure));
      },
      (favorite) {
        bool isFavorite = favorite.message == "تمت الإضافة بنجاح";
        productFavorites[productId] = isFavorite;
        _saveFavoriteStatus(productId, isFavorite);
        emit(AddOrDeleteFavoritesSuccess(favorite: favorite));
      },
    );
  }

  Future<void> _saveFavoriteStatus(int productId, bool isFavorite) async {
    await prefs.saveData(key: 'favorite_$productId', value: isFavorite);
  }

  bool isFavorite(int productId) {
    // Check if the product is already stored in productFavorites
    if (!productFavorites.containsKey(productId)) {
      // If it's not, check if it is stored in preferences
      bool? isFavorite = prefs.getData(key: 'favorite_$productId');
      productFavorites[productId] = isFavorite ?? false; // Default to false if not found
    }
    return productFavorites[productId] ?? false;
  }
}
