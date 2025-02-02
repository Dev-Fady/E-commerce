import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/Sliver_app_bar_delegate.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/all_item_header.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/best_selling_grid_view.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/best_selling_header.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/build_all_item.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/custom_search.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/cutsom_categories_app_bar.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/featured_item_list.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entites/categories_details_entity.dart';

class CategoriesDatailsViewBody extends StatelessWidget {
  const CategoriesDatailsViewBody({
    super.key,
    required this.data,
  });

  final List<CategoriesDetailsEntity> data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                CutsomCategoriesAppBar(),
                SizedBox(height: 16),
                CustomSearch(),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: FeaturedItemList(),
        ),
        SliverPersistentHeader(
          pinned: false,
          delegate: SliverAppBarDelegate(
            child: BestSellingHeader(
              data: data,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          sliver: SliverToBoxAdapter(
            child: BestSellingGridView(
              data: data,
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverAppBarDelegate(
            child: AllItemHeader(data: data),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return BuildAllItem(data: data[index]);
            },
            childCount: data.length,
          ),
        ),
      ],
    );
  }
}
