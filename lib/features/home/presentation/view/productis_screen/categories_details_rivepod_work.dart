import 'package:e_commerce/features/home/presentation/manger/categories_details_riverpod.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/categories_details_view.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class CategoriesDetailsRivepodWork extends ConsumerWidget {
  CategoriesDetailsRivepodWork({super.key, required this.categoryId});

  final int categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesDetails = ref.watch(categoriesDetailsProvider(categoryId));
    return categoriesDetails.when(
      data: (data) {
        return CategoriesDetailsView(data: data);
      },
      error: (err, stack) {
        print('Error: $err');
        return Center(
          child: Text('Error: ${err.toString()}'),
        );
      },
      loading: () {
        return const Scaffold(
          body: LoadingWidget(),
        );
      },
    );
  }
}
