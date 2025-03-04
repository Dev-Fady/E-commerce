import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/orders/data/models/add_order_model.dart';
import 'package:e_commerce/features/orders/data/models/get_order_model.dart';
import 'package:e_commerce/features/orders/data/models/order_details.dart';
import 'package:e_commerce/features/orders/domain/entites/add_orders_entity.dart';
import 'package:e_commerce/features/orders/domain/entites/get_order_entity.dart';
import 'package:e_commerce/features/orders/domain/entites/order_details_entity.dart';
import 'package:e_commerce/features/orders/domain/repo/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final ApiService apiService;

  OrdersRepoImpl({required this.apiService});
  @override
  Future<Either<Faliure, AddOrdersEntity>> addOrders(
      {required String token}) async {
    try {
      final data = await apiService.addorder(
        token,
        {
          "address_id": 1,
          "payment_method": 2,
          "use_points": false,
          "promo_code_id": 0
        },
      );
      log('API Response: $data');
      final addOrderModel = AddOrderModel.fromJson(data);
      final addOrderEntity = addOrderModel.toEntity();
      return Right(addOrderEntity);
    } catch (e) {
      log('Exception in getCategoriesDetails: $e');
      throw Left(CustomException(message: 'حدث خطأ أثنا�� ��لب البيانات.'));
    }
  }

  @override
  Future<Either<Faliure, GetOrderEntity>> getOrder(
      {required String token}) async {
    try {
      final data = await apiService.getOrders(token);
      log('API Response: $data');
      final getOrderModel = GetOrderModel.fromJson(data);
      final getOrderEntity = getOrderModel.toEntity();
      return Right(getOrderEntity);
    } catch (e) {
      log('Exception in getCategoriesDetails: $e');
      throw Left(CustomException(message: 'حدث خطأ أثنا�� ��لب البيانات.'));
    }
  }

  @override
  Future<Either<Faliure, OrderDetailsEntity>> getOrderDetails({required String token, required int id})async {
    try {
      final data = await apiService.orderDetails(token, id);
      log('API Response: $data');
      final orderDetailsModel = OrderDetails.fromJson(data);
      final orderDetailsEntity = orderDetailsModel.toEntity();
      return Right(orderDetailsEntity);
    } catch (e) {
      log('Exception in getOrderDetails: $e');
      throw Left(CustomException(message: 'حدث خطأ أثنا�� ��لب البيانات.'));
    }
  }
}
