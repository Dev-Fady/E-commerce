import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/home/domain/entites/product_search_entity.dart';

abstract class ProtuctSearchState {}

class ProtuctSearchInitial extends ProtuctSearchState {}

class ProtuctSearchLoading extends ProtuctSearchState {}

class ProtuctSearchSuccess extends ProtuctSearchState {
  final ProductSearchEntity productSearch;
  ProtuctSearchSuccess({required this.productSearch});
}

class ProductSearchFailure extends ProtuctSearchState {
  final Faliure error;
  ProductSearchFailure({required this.error});
}
