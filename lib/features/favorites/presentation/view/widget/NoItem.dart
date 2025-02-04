import 'package:flutter/material.dart';

class NoItem extends StatelessWidget {
  const NoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("No favorites yet!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      );
  }
}