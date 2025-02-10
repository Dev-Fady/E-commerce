import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/features/cart/domain/repo/cart_repo.dart';
import 'package:e_commerce/features/cart/presentation/manger/cubit/add_or_delete_cart_state.dart';
import '../../../../../core/services/api/token_storage.dart';

class AddOrDeleteCartCubit extends Cubit<AddOrDeleteCartState> {
  final CartRepo cartRepo;
  final CacheHelper prefs = CacheHelper();

  final Map<int, bool> productCart = {};

  AddOrDeleteCartCubit({required this.cartRepo})
      : super(AddOrDeleteCartInitial());

  Future<void> addOrRemoveCart(int productId) async {
    emit(AddOrDeleteCartLoading());

    final result = await cartRepo.addOrRemoveCart(
      token: TokenStorage().getTokenLogin(),
      productId: productId,
    );

    result.fold(
      (failure) {
        emit(AddOrDeleteCartFailure(error: failure));
      },
      (cart) {
        bool isCart = cart.message == "Added Successfully";
        productCart[productId] = isCart;
        _saveCartStatus(productId, isCart);
        log("******************************${cart.message}****************************}");
        emit(AddOrDeleteCartSuccess(cart: cart));
      },
    );
  }

  Future<void> _saveCartStatus(int productId, bool isCart) async {
    await prefs.saveData(key: 'cart_$productId', value: isCart);
  }

  bool isCart(int productId) {
    if (!productCart.containsKey(productId)) {
      bool? isFavorite = prefs.getData(key: 'cart_$productId');
      productCart[productId] = isFavorite ?? false;
    }
    return productCart[productId] ?? false;
  }

  Future<void> clearCart() async {
    for (var key in prefs.getAllKeys()) {
      if (key.startsWith('cart_')) {
        await prefs.removeData(key: key);
      }
    }
    productCart.clear();
    log("تم مسح جميع العناصر من السلة");
  }
}
