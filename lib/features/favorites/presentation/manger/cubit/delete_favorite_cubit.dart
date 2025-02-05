import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/favorites/domain/entites/delete_favoraite_Entitty.dart';
import 'package:e_commerce/features/favorites/domain/repo/favorites_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_favorite_state.dart';

class DeleteFavoriteCubit extends Cubit<DeleteFavoriteState> {
  final FavoritesRepo favoritesRepo;
  final CacheHelper prefs = CacheHelper();

  final Map<int, bool> productFavorites = {};

  DeleteFavoriteCubit({required this.favoritesRepo})
      : super(DeleteFavoriteInitial());

  Future<void> deleteFavorite(int productId) async {
    emit(DeleteFavoriteLoading());

    final result = await favoritesRepo.deleteFavorite(
      token: TokenStorage().getTokenLogin(),
      productId: productId,
    );

    result.fold(
      (failure) {
        emit(DeleteFavoriteFailure(error: failure));
      },
      (favorite) {
        emit(DeleteFavoriteSuccess(favorite: favorite));
      },
    );
  }
}
