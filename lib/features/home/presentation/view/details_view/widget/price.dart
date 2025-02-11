import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  const Price({
    super.key,
    required this.price,
  });
  final int price;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$ ${price}",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
