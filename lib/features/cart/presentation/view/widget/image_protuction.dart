
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/images.dart';

class ImageProtuction extends StatelessWidget {
  const ImageProtuction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.asset(
          Assets.imageAppIcon2,
          width: 80,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
