import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/cart/domain/entites/add_or_remove_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/get_carts_entity.dart';

abstract class CartRepo {
  Future<Either<Faliure, AddOrRemoveCartEntity>> addOrRemoveCart(
      {required String token, required int productId});

  Future<Either<Faliure, List<GetCartsEntity>>> getCarts(
      {required String token});
}
