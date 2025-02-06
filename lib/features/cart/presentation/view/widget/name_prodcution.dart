import 'package:flutter/material.dart';

class NameProdcution extends StatelessWidget {
  const NameProdcution({
    super.key,
    required this.name,
  });

  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
