import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/orders/data/repo/orders_repo_impl.dart';
import 'package:e_commerce/features/orders/domain/entites/get_order_entity.dart';
import 'package:e_commerce/features/orders/domain/repo/orders_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getOrdersProvider = FutureProvider<GetOrderEntity>((ref) async {
  final orderRepo = ref.watch(getOrderRepoProvider);

  final result =
      await orderRepo.getOrder(token: TokenStorage().getTokenLogin());

  return result.fold(
    (failure) {
      throw Exception(failure);
    },
    (getOrders) => getOrders,
  );
});
final getOrderRepoProvider = Provider<OrdersRepo>((ref) {
  return OrdersRepoImpl(apiService: getIt<ApiService>());
});
