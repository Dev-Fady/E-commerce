import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/home/domain/entites/categories_details_entity.dart';
import 'package:e_commerce/features/home/domain/entites/categories_entity.dart';

abstract class CategoriesRepo {
  Future<Either<Faliure, List<CategoriesEntity>>> getCategories();

  Future<Either<Faliure, List<CategoriesDetailsEntity>>> getCategoriesDetails(
      {required String token,required int categoryId});
}
