import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/home/domain/repo/categories_repo.dart';
import 'package:e_commerce/features/home/presentation/manger/cubit/protuct_search_state.dart';

class ProtuctSearchCubit extends Cubit<ProtuctSearchState> {
  final CategoriesRepo categoriesRepo;

  ProtuctSearchCubit({required this.categoriesRepo})
      : super(ProtuctSearchInitial());

  Future<void> addOrRemoveCart(String productName) async {
    emit(ProtuctSearchLoading());

    final result = await categoriesRepo.productSearch(
      token: TokenStorage().getTokenLogin(),
      nameSearch: productName,
    );

    result.fold(
      (failure) {
        emit(ProductSearchFailure(error: failure));
      },
      (cart) {
        emit(ProtuctSearchSuccess(productSearch: cart));
      },
    );
  }
}
