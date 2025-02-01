import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/Sliver_app_bar_delegate.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/best_selling_grid_view.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/best_selling_header.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/custom_search.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/cutsom_categories_app_bar.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/featured_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../widget/custom_search.dart';
// import '../widget/featured_item_list.dart';

class CategoriesDetailsView extends ConsumerWidget {
  // final CategoriesEntity category;

  const CategoriesDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final productsAsync = ref.watch(ProductsProvider(category.id));

    return Scaffold(
        appBar: AppBar(
          title: const Text("المنتاجات"),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  const CutsomCategoriesAppBar(),
                  SizedBox(height: 16.h),
                  const CustomSearch(),
                  SizedBox(height: 12.h),
                  const FeaturedItemList(),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                child: BestSellingHeader(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 16.h),
            ),
            BestSellingGridView(),
          ],
        ));
  }

  // // 🏷 Widget لعرض المنتجات في القسم المميز
  // Widget _buildProductCard() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Column(
  //       children: [
  //         Container(
  //           width: 120,
  //           height: 120,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(12),
  //             image: DecorationImage(
  //               image: NetworkImage(
  //                   'https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg'),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //         SizedBox(height: 8),
  //         Text('product.name'),
  //         Text("₹ ${15}", style: TextStyle(fontWeight: FontWeight.bold)),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildListItem() {
  //   return Card(
  //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     child: ListTile(
  //       leading: CachedNetworkImage(
  //         imageUrl:
  //             'https://student.valuxapps.com/storage/uploads/products/16387377980g2kx.11.jpg',
  //         width: 60,
  //         height: 60,
  //         fit: BoxFit.cover,
  //       ),
  //       title: Text('product.name'),
  //       subtitle: Text('product.description'),
  //       trailing: Text("₹ ${15}"),
  //     ),
  //   );
  // }
}
