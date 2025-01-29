import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_comsumer.dart';
import 'package:e_commerce/core/services/api/end_ponits.dart';
import 'package:e_commerce/features/home/data/model_categories.dart';
import 'package:e_commerce/features/home/domain/categories_entity.dart';
import 'package:e_commerce/features/home/domain/categories_repo.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final ApiConsumer apiConsumer;

  CategoriesRepoImpl({required this.apiConsumer});

  @override
  Future<Either<Faliure, List<CategoriesEntity>>> getCategories() async {
    try {
      final data = await apiConsumer.get(EndPonits.categories);

      log('API Response: $data'); // Debugging line

      final List<dynamic> results =
          data['data']['data']; // Ensure this matches API response
      final categories = results.map((e) => Datum.fromJson(e)).toList();

      return Right(categories);
    } on DioException catch (e) {
      log('DioException: ${e.message}');
      throw Left(CustomException(message: 'خطأ في الاتصال بالشبكة'));
    } catch (e) {
      log('Exception in getCategories: $e');
      throw Left(CustomException(message: 'حدث خطأ أثناء جلب البيانات.'));
    }
  }
}
