import 'package:flutter/material.dart';

class Quantity extends StatelessWidget {
  const Quantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle, color: Colors.red),
          onPressed: () {}, // Handle decrease quantity
        ),
        const Text('1',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        IconButton(
          icon: const Icon(Icons.add_circle, color: Colors.green),
          onPressed: () {}, // Handle increase quantity
        ),
        const Spacer(),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {},
          child: const Text('تأكيد',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
