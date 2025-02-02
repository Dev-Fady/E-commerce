import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/features/home/domain/entites/categories_details_entity.dart';
import 'package:flutter/material.dart';

import 'featured_item.dart';

class FeaturedItemList extends StatelessWidget {
  const FeaturedItemList({super.key, required this.data});

  final List<CategoriesDetailsEntity> data;

  @override
  Widget build(BuildContext context) {
    final discountedProducts =
        data.where((item) => item.discount! > 0).toList();

    return CarouselSlider.builder(
      itemCount: discountedProducts.length,
      itemBuilder: (context, index, realIndex) {
        return FeaturedItem(
          data: discountedProducts[index],
        );
      },
      options: CarouselOptions(
        aspectRatio: 342 / 165,
        viewportFraction: 0.843,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
    );
  }
}
