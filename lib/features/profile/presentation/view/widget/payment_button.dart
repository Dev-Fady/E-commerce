import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/widget/cusstom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CusstomButton(
        backgroundColor: CupertinoColors.activeBlue,
        borderRadius: 10.r,
        onPressed: () {},
        textStyle: AppTextStyles.bodyBasaBold16,
        buttonText: 'الدفع',
      ),
    );
  }
}
