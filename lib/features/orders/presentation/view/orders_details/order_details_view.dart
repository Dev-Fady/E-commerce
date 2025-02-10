import 'package:flutter/material.dart';

import 'widget/address_details.dart';
import 'widget/order_card.dart';
import 'widget/payment_details.dart';
import 'widget/product_details.dart';

class OrderDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الطلب'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                OrderCard(),
                const SizedBox(height: 16),
                PaymentDetails(),
                const SizedBox(height: 16),
                AddressDetails(),
                const SizedBox(height: 16),
                ProductDetails(),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
