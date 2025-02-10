import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/orders/data/models/add_order_model.dart';
import 'package:e_commerce/features/orders/domain/entites/add_orders_entity.dart';
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
}
