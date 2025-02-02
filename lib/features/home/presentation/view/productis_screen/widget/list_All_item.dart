import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'build_all_item.dart';

class ListAllItem extends StatelessWidget {
  const ListAllItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8.w),
            child: BuildAllItem(),
          );
        },
      ),
    );
  }
}
