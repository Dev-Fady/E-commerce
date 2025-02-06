import 'package:flutter/material.dart';

class PriceProtuction extends StatelessWidget {
  const PriceProtuction({
    super.key,
    required this.price,
  });
  final num price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$ ${price}',
      style: TextStyle(
          fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
    );
  }
}
