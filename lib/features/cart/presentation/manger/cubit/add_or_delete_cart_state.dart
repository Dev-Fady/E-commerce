import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/cart/domain/entites/add_or_remove_cart_entity.dart';

abstract class AddOrDeleteCartState {}

class AddOrDeleteCartInitial extends AddOrDeleteCartState {}

class AddOrDeleteCartLoading extends AddOrDeleteCartState {}

class AddOrDeleteCartSuccess extends AddOrDeleteCartState {
  final AddOrRemoveCartEntity cart;
  AddOrDeleteCartSuccess({required this.cart});
}

class AddOrDeleteCartFailure extends AddOrDeleteCartState {
  final Faliure error;
  AddOrDeleteCartFailure({required this.error});
}
