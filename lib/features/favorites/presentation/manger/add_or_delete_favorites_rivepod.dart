import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/favorites/data/repo/favorites_repo_impl.dart';
import 'package:e_commerce/features/favorites/domain/entites/add_or_delete_favoraite_entity.dart';
import 'package:e_commerce/features/favorites/domain/repo/favorites_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AddOrDeleteFavoritesProvider =
    FutureProvider.family<AddOrDeleteFavoraiteEntity, int>(
        (ref, productId) async {
  final aODFavoritesRepo = ref.watch(AddOrDelelteFavoritesRepoProvider);

  final result = await aODFavoritesRepo.addOrRemoveFavorait(
      token: TokenStorage().getTokenLogin(), productId: productId);

  return result.fold(
    (failure) {
      throw Exception(failure);
    },
    (favorite) => favorite,
  );
});

final AddOrDelelteFavoritesRepoProvider = Provider<FavoritesRepo>((ref) {
  return FavoritesRepoImpl(apiService: getIt<ApiService>());
});
