import 'package:flutter/material.dart';

class DeleteCart extends StatelessWidget {
  const DeleteCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () {}, // Handle remove item
    );
  }
}