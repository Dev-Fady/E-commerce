import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewImages extends StatelessWidget {
  const ListViewImages({
    super.key,
    required this.images,
  });

  final List<dynamic> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(image),
              radius: 30,
            ),
          );
        },
      ),
    );
  }
}
