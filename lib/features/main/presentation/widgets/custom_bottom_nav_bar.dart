import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 80.h,
          child: CustomPaint(
            painter: BottomNavPainter(),
            child: Container(
              height: 80.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Remix.home_5_line,
                        color: selectedIndex == 0 ? Colors.blue : Colors.grey),
                    onPressed: () => onItemTapped(0),
                  ),
                  IconButton(
                    icon: Icon(Remix.heart_3_line,
                        color: selectedIndex == 1 ? Colors.blue : Colors.grey),
                    onPressed: () => onItemTapped(1),
                  ),
                  SizedBox(width: 40.w),
                  IconButton(
                    icon: Icon(Remix.store_line,
                        color: selectedIndex == 3 ? Colors.blue : Colors.grey),
                    onPressed: () => onItemTapped(3),
                  ),
                  IconButton(
                    icon: Icon(Remix.user_2_fill,
                        color: selectedIndex == 4 ? Colors.blue : Colors.grey),
                    onPressed: () => onItemTapped(4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Path path = Path();
    path.moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.38, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(22), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.62, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black12, 8, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
