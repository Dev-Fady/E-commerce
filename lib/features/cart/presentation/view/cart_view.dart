import 'package:flutter/material.dart';

import 'widget/cart_view_body.dart';
import 'widget/cart_view_botton_navigation_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F9),
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          'سلة المشتريات',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: CartViewBody(),
      bottomNavigationBar: CartViewBottonNavigationBar(),
    );
  }
}
