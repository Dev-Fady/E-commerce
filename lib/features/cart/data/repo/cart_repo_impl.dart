import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/cart/data/model/add_or_remove_cart_model.dart';
import 'package:e_commerce/features/cart/domain/entites/add_or_remove_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repo/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final ApiService apiService;

  CartRepoImpl({required this.apiService});
  @override
  Future<Either<Faliure, AddOrRemoveCartEntity>> addOrRemoveCart(
      {required String token, required int productId}) async {
    try {
      final response = await apiService.addOrDeleteCart(
        token,
        {
          'product_id': productId,
        },
      );
      final addOrDeleteCartModel = AddOrRemoveCartModel.fromJson(response);
      final addOrDeleteCartEntity = addOrDeleteCartModel.toEntity();

      return Right(addOrDeleteCartEntity);
    } catch (e) {
      log('Exception in addOrRemoveCart: $e');
      return Left(ServerFaliure(" حدث خطأ ما. الرجاء المحاولة مرة أخرى. "));
    }
  }
}
