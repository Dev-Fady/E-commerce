import 'package:e_commerce/features/home/presentation/manger/categories_riverpod.dart';
import 'package:e_commerce/features/home/presentation/view/widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryBody extends ConsumerWidget {
  const CategoryBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(CategoriesProvider);
    return categoriesAsync.when(
      data: (categories) {
        return GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return CategoryItem(
              cate: categories[index],
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) {
        print('Error: $err');
        return Center(
          child: Text('Error: ${err.toString()}'),
        );
      },
    );
  }
}
