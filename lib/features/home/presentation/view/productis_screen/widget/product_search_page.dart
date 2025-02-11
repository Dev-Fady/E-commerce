import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/home/data/repo/categories_repo_impl.dart';
import 'package:e_commerce/features/home/presentation/manger/cubit/protuct_search_cubit.dart';
import 'package:e_commerce/features/home/presentation/manger/cubit/protuct_search_state.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSearchPage extends StatelessWidget {
  final String searchQuery;

  const ProductSearchPage({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('نتائج البحث')),
      body: BlocProvider(
        create: (context) => ProtuctSearchCubit(
          categoriesRepo: CategoriesRepoImpl(apiService: getIt<ApiService>()),
        )..addOrRemoveCart(searchQuery),
        child: BlocBuilder<ProtuctSearchCubit, ProtuctSearchState>(
          builder: (context, state) {
            if (state is ProtuctSearchLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductSearchFailure) {
              return Center(child: Text('حدث خطأ: ${state.error}'));
            } else if (state is ProtuctSearchSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: state.productSearch.data!.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.59,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final product = state.productSearch.data!.data![index];
                    return ProductCard(product: product);
                  },
                ),
              );
            }
            return Center(child: Text('ابدأ بالبحث عن منتج!'));
          },
        ),
      ),
    );
  }
}
