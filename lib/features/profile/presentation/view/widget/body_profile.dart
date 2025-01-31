import 'package:e_commerce/features/profile/presentation/view/widget/logout_button.dart';
import 'package:e_commerce/features/profile/presentation/view/widget/payment_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_styles.dart';
import 'build_list_tile.dart';
import 'credit_and_points.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          // Profile Picture
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/customer/avatar.png'),
          ),
          SizedBox(height: 20.h),
          // Name
          Text('محمد أحمد', style: AppTextStyles.heading23Bold),
          SizedBox(height: 8.h),
          // Email
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "fady46t45f@gmail.com",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          // Stats Row
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CreditAndPoints(label: 'النقاط', value: '350'),
                CreditAndPoints(label: 'الرصيد', value: '50'),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          // Payment Button
          PaymentButton(),
          const SizedBox(height: 30),
          // Options List
          const Column(
            children: [
              BuildListTile(icon: CupertinoIcons.settings, title: 'الإعدادات'),
              BuildListTile(icon: CupertinoIcons.chat_bubble, title: 'الرسائل'),
              BuildListTile(icon: CupertinoIcons.heart, title: 'النشاط'),
              BuildListTile(icon: CupertinoIcons.bookmark, title: 'المحفوظات'),
              BuildListTile(icon: CupertinoIcons.bell, title: 'الإشعارات'),
              BuildListTile(
                  icon: CupertinoIcons.question_circle, title: 'المساعدة')
            ],
          ),
          SizedBox(height: 15.h),
          // Logout Button
          LogoutButton(),
        ],
      ),
    );
  }
}
