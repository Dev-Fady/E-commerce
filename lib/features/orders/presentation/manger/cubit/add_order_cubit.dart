import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/cart/data/repo/cart_repo_impl.dart';
import 'package:e_commerce/features/cart/presentation/manger/cubit/add_or_delete_cart_cubit.dart';
import 'package:e_commerce/features/orders/domain/repo/orders_repo.dart';
import 'package:e_commerce/features/orders/presentation/manger/cubit/add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  final OrdersRepo ordersRepo;
  final CacheHelper prefs = CacheHelper();

  AddOrderCubit({required this.ordersRepo}) : super(AddOrderInitial());

  Future<void> addOrder() async {
    emit(AddOrderLoading());

    final result =
        await ordersRepo.addOrders(token: TokenStorage().getTokenLogin());

    result.fold(
      (failure) {
        emit(AddOrderFailure(error: failure));
      },
      (order) async {
        await clearCart();
        emit(AddOrderSuccess(addOrder: order));
      },
    );
  }

  Future<void> clearCart() async {
    await AddOrDeleteCartCubit(
            cartRepo: CartRepoImpl(apiService: getIt<ApiService>()))
        .clearCart();
  }
}
