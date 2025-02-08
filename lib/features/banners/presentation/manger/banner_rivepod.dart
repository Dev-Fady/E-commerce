import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/banners/data/repo/banner_repo_impl.dart';
import 'package:e_commerce/features/banners/domain/entites/banner_entity.dart';
import 'package:e_commerce/features/banners/domain/repo/banner_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getBannerProvider = FutureProvider<BannerEntity>((ref) async {
  final bannerRepo = ref.watch(bannerRepoProvider);

  final result =
      await bannerRepo.getBanner(token: TokenStorage().getTokenLogin());

  return result.fold(
    (failure) {
      throw Exception(failure);
    },
    (bannerRepo) => bannerRepo,
  );
});

final bannerRepoProvider = Provider<BannerRepo>((ref) {
  return BannerRepoImpl(apiService: getIt<ApiService>());
});
