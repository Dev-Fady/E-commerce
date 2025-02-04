import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/favorites/data/repo/favorites_repo_impl.dart';
import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
import 'package:e_commerce/features/favorites/domain/repo/favorites_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getFavoritesProvider =
    FutureProvider<List<GetFavoritesEntity>>((ref) async {
  final favoriteRepo = ref.watch(getFavoriteRepoProvider);

  final result = await favoriteRepo.getFavoritesEntity(
      token: TokenStorage().getTokenLogin());

  return result.fold(
    (failure) {
      throw Exception(failure);
    },
    (favoriteRepo) => favoriteRepo,
  );
});

final getFavoriteRepoProvider = Provider<FavoritesRepo>((ref) {
  return FavoritesRepoImpl(apiService: getIt<ApiService>());
});
