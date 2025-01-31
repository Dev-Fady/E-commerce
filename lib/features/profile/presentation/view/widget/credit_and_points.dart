import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditAndPoints extends StatelessWidget {
  const CreditAndPoints({super.key, required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        value,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: const TextStyle(
          color: CupertinoColors.systemGrey,
        ),
      ),
    ]);
  }
}
