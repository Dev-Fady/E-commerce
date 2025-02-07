import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/cart/domain/entites/delete_cart_entity.dart';

abstract class DeleteCartState {}

class DeleteCartInitial extends DeleteCartState {}

class DeleteCartLoading extends DeleteCartState {}

class DeleteCartSuccess extends DeleteCartState {
  final DeleteCartEntity Cart;
  DeleteCartSuccess({required this.Cart});
}

class DeleteCartFailure extends DeleteCartState {
  final Faliure error;
  DeleteCartFailure({required this.error});
}
