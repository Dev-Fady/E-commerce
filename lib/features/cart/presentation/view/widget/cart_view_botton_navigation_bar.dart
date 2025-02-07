import 'package:e_commerce/features/cart/domain/entites/get_carts_entity.dart';
import 'package:flutter/material.dart';

class CartViewBottonNavigationBar extends StatelessWidget {
  const CartViewBottonNavigationBar({
    super.key,
    required this.data,
  });
  final GetCartsEntity data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {}, // Handle checkout
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          'إتمام الشراء ${data.subTotal}  L.E',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
