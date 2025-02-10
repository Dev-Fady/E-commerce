import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entites/banner_entity.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.products,
  }) : super(key: key);

  final Products products;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RouterName.banner_product_details_view, extra: products);
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    products.image,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "${products.discount}% خصم",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                products.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                children: [
                  Text(
                    "\$${products.price}",
                    style:
                        const TextStyle(fontSize: 16, color: Colors.deepOrange),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "\$${products.oldPrice}",
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
