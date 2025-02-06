import 'package:e_commerce/features/cart/presentation/view/widget/delete_cart.dart';
import 'package:e_commerce/features/cart/presentation/view/widget/image_protuction.dart';
import 'package:e_commerce/features/cart/presentation/view/widget/name_prodcution.dart';
import 'package:e_commerce/features/cart/presentation/view/widget/price_protuction.dart';
import 'package:e_commerce/features/cart/presentation/view/widget/quantity.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 3, // Replace with cart items count
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                ImageProtuction(),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NameProdcution(name: 'Prod name'),
                      SizedBox(height: 4),
                      PriceProtuction(price: 50.00),
                      SizedBox(height: 8),
                      Quantity(),
                    ],
                  ),
                ),
                DeleteCart(),
              ],
            ),
          ),
        );
      },
    );
  }
}
