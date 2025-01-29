import 'package:e_commerce/features/home/presentation/view/widget/category_item.dart';
import 'package:flutter/material.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return CategoryItem();
      },
    );
  }
}

