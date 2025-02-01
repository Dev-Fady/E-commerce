import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/BestSeller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 240.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: BestSeller(),
            );
          },
        ),
      ),
    );
  }
}
