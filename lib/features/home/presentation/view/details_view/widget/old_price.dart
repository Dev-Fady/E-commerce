import 'package:flutter/material.dart';

class OldPrice extends StatelessWidget {
  const OldPrice({
    super.key,
    required this.oldPrice,
  });
  final int oldPrice;
  @override
  Widget build(BuildContext context) {
    return Text(
      "\$ ${oldPrice}",
      style:
          TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough),
    );
  }
}
