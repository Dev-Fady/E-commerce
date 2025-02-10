import 'package:e_commerce/features/orders/domain/entites/order_details_entity.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final OrderDetailsEntity products;

  const ProductDetails({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('المنتجات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: products.data!.products!.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Image.network(
                        products.data!.products![index].image!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products.data!.products![index].name!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                                'السعر: ${products.data!.products![index].price!} جنيه',
                                style: TextStyle(color: Colors.green)),
                            Text(
                                'الكمية: ${products.data!.products![index].quantity}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
