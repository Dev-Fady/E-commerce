import 'package:e_commerce/core/DI/dependency_injection.dart';
// import 'package:e_commerce/core/services/api/api_comsumer.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/home/data/repo/categories_repo_impl.dart';
import 'package:e_commerce/features/home/domain/categories_entity.dart';
import 'package:e_commerce/features/home/domain/categories_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final CategoriesProvider = FutureProvider<List<CategoriesEntity>>((ref) async {
  final categoryRepo = ref.watch(categoryRepoProvider);

  final result = await categoryRepo.getCategories();

  return result.fold(
    (failure) {
      throw Exception(failure);
    },
    (characters) => characters,
  );
});

final categoryRepoProvider = Provider<CategoriesRepo>((ref) {
  return CategoriesRepoImpl(apiService: getIt<ApiService>());
});
