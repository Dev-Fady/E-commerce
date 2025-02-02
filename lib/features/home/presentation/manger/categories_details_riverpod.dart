import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/home/domain/repo/categories_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/api/api_service.dart';
import '../../data/repo/categories_repo_impl.dart';
import '../../domain/entites/categories_details_entity.dart';

final categoriesDetailsProvider =
    FutureProvider.family<List<CategoriesDetailsEntity>, int>(
        (ref, categoryId) async {
  final categoryRepo = ref.watch(categoryRepoProvider);

  final result = await categoryRepo.getCategoriesDetails(
      token: TokenStorage().getTokenLogin(), categoryId: categoryId);

  return result.fold(
    (failure) {
      throw Exception(failure);
    },
    (charactersDetails) => charactersDetails,
  );
});

final categoryRepoProvider = Provider<CategoriesRepo>((ref) {
  return CategoriesRepoImpl(apiService: getIt<ApiService>());
});
