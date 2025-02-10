import 'package:e_commerce/features/orders/presentation/manger/order_details_rivepod.dart';
import 'package:e_commerce/features/orders/presentation/view/orders_details/order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderDatailsRivepodWork extends ConsumerWidget {
  const OrderDatailsRivepodWork({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProfileAsync = ref.watch(orderDetailsRivepod(id));
    return getProfileAsync.when(
      data: (data) {
        return OrderDetailsView(data: data);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) {
        print('Error: $err');
        return Center(
          child: Text('Error: ${err.toString()}'),
        );
      },
    );
  }
}
