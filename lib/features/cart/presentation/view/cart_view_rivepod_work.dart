import 'package:e_commerce/features/cart/presentation/manger/get_cart_rivepod.dart';
import 'package:e_commerce/features/cart/presentation/view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartViewRivepodWork extends ConsumerWidget {
  const CartViewRivepodWork({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(getCartProvider);
    return carts.when(
      data: (data) {
        return CartView(
          data: data,
        );
      },
      error: (err, stack) {
        print('Error: $err');
        return Center(
          child: Text('Error: ${err.toString()}'),
        );
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
