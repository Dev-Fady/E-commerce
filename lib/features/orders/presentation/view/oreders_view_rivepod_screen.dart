import 'package:e_commerce/features/orders/presentation/view/widget/body_order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../manger/get_orders_rivepod.dart';

class OredersViewRivepodScreen extends ConsumerWidget {
  const OredersViewRivepodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProfileAsync = ref.watch(getOrdersProvider);
    return getProfileAsync.when(
      data: (data) {
        return BodyOrderView(
          orders: data,
        );
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
