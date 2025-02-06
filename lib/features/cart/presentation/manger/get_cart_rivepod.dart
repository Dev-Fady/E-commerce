import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/cart/data/repo/cart_repo_impl.dart';
import 'package:e_commerce/features/cart/domain/entites/get_carts_entity.dart';
import 'package:e_commerce/features/cart/domain/repo/cart_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCartProvider = FutureProvider<List<GetCartsEntity>>((ref) async {
  final cartRepo = ref.watch(getCartRepoProvider);

  final result = await cartRepo.getCarts(token: TokenStorage().getTokenLogin());

  return result.fold(
    (failure) {
      throw Exception(failure);
    },
    (cartRepo) => cartRepo,
  );
});

final getCartRepoProvider = Provider<CartRepo>((ref) {
  return CartRepoImpl(apiService: getIt<ApiService>());
});
