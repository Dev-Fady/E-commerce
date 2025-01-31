import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/body_profile.dart';

class PerfileView extends StatelessWidget {
  const PerfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F9),
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'الملف الشخصي',
          style: AppTextStyles.bodyBasaSemiBold16,
        ),
        centerTitle: true,
      ),
      body: BodyProfile(),
    );
  }
}
