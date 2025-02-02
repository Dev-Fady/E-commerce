import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/Sliver_app_bar_delegate.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/best_selling_grid_view.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/best_selling_header.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/build_all_item.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/custom_search.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/cutsom_categories_app_bar.dart';
import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/featured_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class CategoriesDetailsView extends StatefulWidget {
  const CategoriesDetailsView({Key? key}) : super(key: key);

  @override
  _CategoriesDetailsViewState createState() => _CategoriesDetailsViewState();
}

class _CategoriesDetailsViewState extends State<CategoriesDetailsView> {
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المنتجات"),
        centerTitle: true,
      ),
      body: CustomScrollView(
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
            child: isLoading ? ProfileShimmer() : const FeaturedItemList(),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              child: const BestSellingHeader(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            sliver: isLoading
                ? SliverToBoxAdapter(child: ListTileShimmer())
                : const SliverToBoxAdapter(child: BestSellingGridView()),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return isLoading ? ListTileShimmer() : BuildAllItem();
              },
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
