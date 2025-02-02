import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/BestSeller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entites/categories_details_entity.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({
    super.key,
    required this.data,
  });

  final List<CategoriesDetailsEntity> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length ,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: BestSeller(
              data: data[index],
            ),
          );
        },
      ),
    );
  }
}
