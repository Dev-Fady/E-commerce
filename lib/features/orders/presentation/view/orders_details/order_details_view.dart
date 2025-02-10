import 'package:e_commerce/features/orders/domain/entites/order_details_entity.dart';
import 'package:flutter/material.dart';

import 'widget/address_details.dart';
import 'widget/order_card.dart';
import 'widget/payment_details.dart';
import 'widget/product_details.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.data});

  final OrderDetailsEntity data;
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
                OrderCard(data: data),
                const SizedBox(height: 16),
                PaymentDetails(data: data),
                const SizedBox(height: 16),
                AddressDetails(data: data),
                const SizedBox(height: 16),
                ProductDetails(products: data,),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
