import 'package:e_commerce/features/banners/domain/entites/banner_entity.dart';
import 'package:e_commerce/features/banners/presentation/view/widget/banner_slider.dart';
import 'package:e_commerce/features/banners/presentation/view/widget/product_grid_view.dart';
import 'package:flutter/material.dart';

class BannerViewBody extends StatelessWidget {
  const BannerViewBody({
    super.key,
    required this.data,
  });

  final BannerEntity data;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BannerSlider(banners: data.data.banners),
        const SizedBox(height: 10),
        // عنوان المنتجات
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "المنتجات",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        ProductGridView(
          products: data.data.products,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              data.data.ad,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
