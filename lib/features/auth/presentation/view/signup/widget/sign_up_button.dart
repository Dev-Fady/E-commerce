import 'package:e_commerce/core/helper_functions/build_error_message.dart';
import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/widget/cusstom_button.dart';
import 'package:e_commerce/features/auth/data/model/user_model_api.dart';
import 'package:e_commerce/features/auth/presentation/manger/sign_up/register_using_api_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpButton extends ConsumerStatefulWidget {
  const SignUpButton({
    super.key,
    required this.isTermsAccepted,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.autovalidateMode,
    required this.updateAutovalidateMode,
    required this.phoneController,
  });

  final bool isTermsAccepted;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final Function(AutovalidateMode) updateAutovalidateMode;

  @override
  ConsumerState<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends ConsumerState<SignUpButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CusstomButton(
      buttonText: isLoading ? 'جارٍ التسجيل...' : 'إنشاء حساب جديد',
      textStyle: AppTextStyles.bodyBasaBold16,
      onPressed: widget.isTermsAccepted
          ? () async {
              if (widget.formKey.currentState!.validate()) {
                setState(() {
                  isLoading = true;
                });
                final profilepic = ref.read(profilePicProvider);
                final userModel = UserModelApi(
                  name: widget.nameController.text,
                  email: widget.emailController.text,
                  password: widget.passwordController.text,
                  image: profilepic?.path ?? '',
                  phone: widget.phoneController.text,
                );

                final result =
                    await ref.read(registerUsingApiProvider(userModel).future);

                result.fold(
                  (failure) {
                    buildErrorBar(context, failure.toString());
                  },
                  (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تم التسجيل بنجاح')),
                    );
                    context.goNamed(RouterName.login);
                  },
                );

                setState(() {
                  isLoading = false;
                });
              } else {
                widget.updateAutovalidateMode(AutovalidateMode.always);
              }
            }
          : () {
              buildErrorBar(context, 'يجب أن تقبل الشروط والأحكام');
            },
      backgroundColor: widget.isTermsAccepted ? null : AppColors.grayscale300,
    );
  }
}
