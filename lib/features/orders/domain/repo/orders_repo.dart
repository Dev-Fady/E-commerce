import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/orders/domain/entites/add_orders_entity.dart';
import 'package:e_commerce/features/orders/domain/entites/get_order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Faliure, AddOrdersEntity>> addOrders({required String token});
  Future<Either<Faliure, GetOrderEntity>> getOrder({required String token});
}
