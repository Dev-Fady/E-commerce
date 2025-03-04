import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/home/data/model/categories_details_model.dart';
import 'package:e_commerce/features/home/data/model/categories_model.dart';
import 'package:e_commerce/features/home/data/model/product_search_model.dart';
import 'package:e_commerce/features/home/domain/entites/categories_details_entity.dart';
import 'package:e_commerce/features/home/domain/entites/categories_entity.dart';
import 'package:e_commerce/features/home/domain/entites/product_search_entity.dart';
import 'package:e_commerce/features/home/domain/repo/categories_repo.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final ApiService apiService;

  CategoriesRepoImpl({required this.apiService});

  @override
  Future<Either<Faliure, List<CategoriesEntity>>> getCategories() async {
    try {
      final data = await apiService.getCategories();

      log('API Response: $data');

      final List<dynamic> results = data['data']['data'];
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

  @override
  Future<Either<Faliure, List<CategoriesDetailsEntity>>> getCategoriesDetails(
      {required String token, required int categoryId}) async {
    try {
      final data = await apiService.categoryDetails(token, categoryId);
      log('API Response: $data');
      final List<dynamic> results = data['data']['data'];
      final products = results.map((e) => DataPro.fromJson(e)).toList();
      return Right(products);
    } catch (e) {
      log('Exception in getCategoriesDetails: $e');
      throw Left(CustomException(message: 'حدث خطأ أثنا�� ��لب البيانات.'));
    }
  }

  @override
  Future<Either<Faliure, ProductSearchEntity>> productSearch(
      {required String token, required String nameSearch}) async {
    try {
      final data = await apiService.productSearch(
        token,
        {
          "text": nameSearch,
        },
      );
      log('API Response: $data');
      final resultModel = ProductSearchModel.fromJson(data);
      final resultentity = resultModel.toEntity();
      return Right(resultentity);
    } catch (e) {
      log('Exception in product Search: $e');
      throw Left(CustomException(message: 'حدث خطأ أثنا�� ��لب البيانات.'));
    }
  }
}
