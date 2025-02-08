import 'package:e_commerce/features/banners/domain/entites/banner_entity.dart';
import 'package:e_commerce/features/banners/presentation/view/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    required this.products,
  });

  final List<Products> products;

  @override
  Widget build(BuildContext context) {
    // تصفية المنتجات التي تحتوي على خصم فقط
    final List<Products> discountedProducts =
        products.where((product) => product.discount > 0).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: discountedProducts.length, // تمرير عدد المنتجات المخفضة فقط
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            products: discountedProducts[index], // تمرير المنتجات المخفضة فقط
          );
        },
      ),
    );
  }
}
