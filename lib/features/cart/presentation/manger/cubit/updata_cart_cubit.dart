import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/cart/domain/repo/cart_repo.dart';

import 'updata_cart_state.dart';

class UpdataCartCubit extends Cubit<UpdataCartState> {
  final CartRepo cartRepo;
  final CacheHelper prefs = CacheHelper();

  UpdataCartCubit({required this.cartRepo}) : super(UpdataCartInitial());

  Future<void> updataCart(int productId, int quantity) async {
    emit(UpdataCartLoading());

    final result = await cartRepo.updataCart(
      token: TokenStorage().getTokenLogin(),
      productId: productId,
      quantity: quantity,
    );

    result.fold(
      (failure) {
        emit(UpdataCartFailure(error: failure));
      },
      (cart) async {
        emit(UpdataCartSuccess(Cart: cart));
      },
    );
  }
}
