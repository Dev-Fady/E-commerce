import 'package:flutter/widgets.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

import 'custom_search.dart';
import 'cutsom_categories_app_bar.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

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
            // child: FeaturedItemList(),
            ),
        const SliverToBoxAdapter(
          child: ProfileShimmer(),
        ),
        const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            sliver: SliverToBoxAdapter(child: ListTileShimmer())),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const ListTileShimmer();
            },
            childCount: 15,
          ),
        ),
      ],
    );
  }
}
