import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/orders/data/repo/orders_repo_impl.dart';
import 'package:e_commerce/features/orders/domain/entites/order_details_entity.dart';
import 'package:e_commerce/features/orders/domain/repo/orders_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderDetailsRivepod =
    FutureProvider.family<OrderDetailsEntity, int>((ref, id) async {
  final orderRepo = ref.watch(getOrderDetailsProvider);

  final result = await orderRepo.getOrderDetails(
      token: TokenStorage().getTokenLogin(), id: id);

  return result.fold(
    (failure) {
      throw Exception(failure);
    },
    (order) => order,
  );
});
final getOrderDetailsProvider = Provider<OrdersRepo>((ref) {
  return OrdersRepoImpl(apiService: getIt<ApiService>());
});
