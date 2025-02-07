import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/cart/domain/entites/updata_cart_entity.dart';

abstract class UpdataCartState {}

class UpdataCartInitial extends UpdataCartState {}

class UpdataCartLoading extends UpdataCartState {}

class UpdataCartSuccess extends UpdataCartState {
  final UpdataCartEntity Cart;
  UpdataCartSuccess({required this.Cart});
}

class UpdataCartFailure extends UpdataCartState {
  final Faliure error;
  UpdataCartFailure({required this.error});
}
