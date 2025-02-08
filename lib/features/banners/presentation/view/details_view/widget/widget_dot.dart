import 'package:e_commerce/features/product_details/view/widget/build_dot.dart';
import 'package:flutter/material.dart';

class widgetDot extends StatelessWidget {
  const widgetDot({
    super.key,
    required this.images,
    required this.currentIndex,
  });

  final List<dynamic> images;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(images.length,
          (index) => BuildDot(index: index, currentIndex: currentIndex)),
    );
  }
}
