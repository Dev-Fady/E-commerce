import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/cart/domain/repo/cart_repo.dart';
import 'package:e_commerce/features/cart/presentation/manger/cubit/delete_cart_state.dart';

class DeleteCartCubit extends Cubit<DeleteCartState> {
  final CartRepo cartRepo;
  final CacheHelper prefs = CacheHelper();

  // final Map<int, bool> productFavorites = {};

  DeleteCartCubit({required this.cartRepo}) : super(DeleteCartInitial());

  Future<void> deleteFavorite(int productId) async {
    emit(DeleteCartLoading());

    final result = await cartRepo.deleteCart(
      token: TokenStorage().getTokenLogin(),
      productId: productId,
    );

    result.fold(
      (failure) {
        emit(DeleteCartFailure(error: failure));
      },
      (cart) async {
        await prefs.removeData(key: 'cart_${cart.data!.cart!.product!.id}');
        emit(DeleteCartSuccess(Cart: cart));
      },
    );
  }
}
