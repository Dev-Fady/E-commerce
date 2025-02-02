// import 'package:e_commerce/features/home/domain/entites/categories_entity.dart';
import 'package:e_commerce/features/home/presentation/manger/categories_details_riverpod.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/categories_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

// ignore: must_be_immutable
class CategoriesDetailsRivepodWork extends ConsumerWidget {
  CategoriesDetailsRivepodWork({super.key, required this.categoryId});

  final int categoryId;
  // late int id = categoryId.id;

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
        return const ProfileShimmer();
      },
    );
  }
}
