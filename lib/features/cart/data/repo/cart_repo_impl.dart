import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/cart/data/model/add_or_remove_cart_model.dart';
import 'package:e_commerce/features/cart/data/model/delete_cart_model.dart';
import 'package:e_commerce/features/cart/data/model/get_carts_model.dart';
import 'package:e_commerce/features/cart/data/model/updata_cart_model.dart';
import 'package:e_commerce/features/cart/domain/entites/add_or_remove_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/delete_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/get_carts_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/updata_cart_entity.dart';
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

  @override
  Future<Either<Faliure, List<GetCartsEntity>>> getCarts(
      {required String token}) async {
    try {
      final data = await apiService.getCart(token);
      log('API Response: $data');

      final List<dynamic> results = data['data']['cart_items'];

      final double subTotal = (data['data']['sub_total'] as num).toDouble();
      final double total = (data['data']['total'] as num).toDouble();

      final products = results
          .map((item) =>
              CartItems.fromJson(item)..setSubTotalAndTotal(subTotal, total))
          .toList();

      return Right(products);
    } catch (e) {
      log('Exception in GetFavoritesEntity: $e');
      throw Left(CustomException(message: 'حدث خطأ أثناء طلب البيانات.'));
    }
  }

  @override
  Future<Either<Faliure, DeleteCartEntity>> deleteCart(
      {required String token, required int productId}) async {
    try {
      final response = await apiService.deleteCart(token, productId);
      final deleteCartModel = DeleteCartModel.fromJson(response);
      final deleteCartEntity = deleteCartModel.toEntity();
      return Right(deleteCartEntity);
    } catch (e) {
      log('Exception in deleteFavorite: $e');
      return Left(ServerFaliure("حدث خطأ ما. الرجا�� المحاولة مرة ا��خرى. "));
    }
  }

  @override
  Future<Either<Faliure, UpdataCartEntity>> updataCart(
      {required String token,
      required int productId,
      required int quantity}) async {
    try {
      final response = await apiService.updataCart(token, productId, {
        "quantity": quantity,
      });
      final updateCartModel = UpdataCartModel.fromJson(response);
      final updateCartEntity = updateCartModel.toEntity();
      return Right(updateCartEntity);
    } catch (e) {
      log('Exception in updataCart: $e');
      return Left(ServerFaliure("حدث خطأ ما. الرجا�� المحاولة مرة ا��خرى. "));
    }
  }
}
