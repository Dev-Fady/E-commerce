import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFavorite extends StatelessWidget {
  const AddFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.favorite_border,
        size: 32.h,
      ),
    );
  }
}
