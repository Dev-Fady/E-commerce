import 'package:flutter/material.dart';

class NoItem extends StatelessWidget {
  const NoItem({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
