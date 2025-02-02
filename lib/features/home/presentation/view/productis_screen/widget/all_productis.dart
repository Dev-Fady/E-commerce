import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/build_all_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../domain/entites/categories_details_entity.dart';

class AllProductis extends StatelessWidget {
  const AllProductis({super.key, required this.data});
  final List<CategoriesDetailsEntity> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('جميع المنتاجات'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return BuildAllItem(data: data[index]);
              },
              childCount: data.length,
            ),
          ),
        ],
      ),
    );
  }
}
