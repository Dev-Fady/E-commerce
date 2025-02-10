import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/orders/domain/entites/add_orders_entity.dart';

abstract class AddOrderState {}

class AddOrderInitial extends AddOrderState {}

class AddOrderLoading extends AddOrderState {}

class AddOrderSuccess extends AddOrderState {
  final AddOrdersEntity addOrder;
  AddOrderSuccess({required this.addOrder});
}

class AddOrderFailure extends AddOrderState {
  final Faliure error;
  AddOrderFailure({required this.error});
}
