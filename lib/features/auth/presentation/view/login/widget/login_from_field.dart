import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/helper_functions/build_error_message.dart';
import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/core/widget/custom_snackbar.dart';
import 'package:e_commerce/features/auth/presentation/manger/login/login_using_api_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/constants/constanst.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widget/app_text_form_field.dart';
import '../../../../../../core/widget/cusstom_button.dart';
import '../../../../data/model/login_request.dart';

class LoginFromField extends ConsumerStatefulWidget {
  const LoginFromField({super.key});

  @override
  ConsumerState<LoginFromField> createState() => _LoginFromFieldState();
}

class _LoginFromFieldState extends ConsumerState<LoginFromField> {
  bool isObscureText = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppTextFormField(
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'رجاء ادخال كلمة المرور';
              }
              return null;
            },
            controller: emailController,
          ),
          SizedBox(height: 16.h),
          AppTextFormField(
            hintText: 'كلمة المرور',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'رجاء ادخال كلمة المرور';
              }
              return null;
            },
            controller: passwordController,
            isObscureText: isObscureText,
            keyboardType: TextInputType.visiblePassword,
            maxlines: 1,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xffC9CECF),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          AutoSizeText(
            'نسيت كلمة المرور؟',
            style: AppTextStyles.bodySmallSemiBold13.copyWith(
              color: AppColors.green1_600,
            ),
          ),
          SizedBox(height: 33.h),
          LoginButton(
            autovalidateMode: autovalidateMode,
            emailController: emailController,
            passwordController: passwordController,
            formKey: formKey,
            updateAutovalidateMode: (mode) {
              setState(() {
                autovalidateMode = mode;
              });
            },
          ),
        ],
      ),
    );
  }
}

class LoginButton extends ConsumerStatefulWidget {
  const LoginButton({
    super.key,
    required this.autovalidateMode,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.updateAutovalidateMode,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final Function(AutovalidateMode) updateAutovalidateMode;

  @override
  ConsumerState<LoginButton> createState() => _LoginButtonState();
}

final isLoadingProvider = StateProvider<bool>((ref) => false);

class _LoginButtonState extends ConsumerState<LoginButton> {
  Future<void> loginUser() async {
    if (!widget.formKey.currentState!.validate()) {
      widget.updateAutovalidateMode(AutovalidateMode.always);
      return;
    }

    ref.read(isLoadingProvider.notifier).state = true;
    log("isLoading: ${ref.read(isLoadingProvider)}");

    try {
      final loginRequest = LoginRequest(
        email: widget.emailController.text,
        password: widget.passwordController.text,
      );

      final result = await ref.read(loginUsingApiProvider(loginRequest).future);

      result.fold(
        (failure) {
          log("********************************************${failure.message}");
          buildErrorBar(context, failure.message);
        },
        (success) async {
            CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: 'تم التسجيل بنجاح',
            type: ContentType.success,
          );
          await CacheHelper().saveData(key: kIsLigingViewSeen, value: true);
          context.goNamed(RouterName.main_view);
        },
      );
    } catch (e) {
      log("Unexpected error: $e");
      buildErrorBar(context, 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.');
    } finally {
      ref.read(isLoadingProvider.notifier).state = false;
      log("isLoading: ${ref.read(isLoadingProvider)}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(isLoadingProvider);

    return CusstomButton(
      buttonText: isLoading ? 'جار تجسيل الدخول ...' : 'تسجيل دخول',
      textStyle: AppTextStyles.bodyBasaBold16,
      onPressed: () {
        if (widget.formKey.currentState!.validate()) {
          loginUser();
        }
      },
    );
  }
}
// using the cubit and firebase
/**
 * return Form(
      key: context.read<LoginCubit>().formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppTextFormField(
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'رجاء ادخال البريد الإلكتروني';
              }
              return null;
            },
            controller: context.read<LoginCubit>().emailContoller,
          ),
          SizedBox(height: 16.h),
          AppTextFormField(
            hintText: 'كلمة المرور',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'رجاء ادخال كلمة المرور';
              }
              return null;
            },
            controller: context.read<LoginCubit>().passwordContoller,
            isObscureText: isObscureText,
            keyboardType: TextInputType.visiblePassword,
            maxlines: 1,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xffC9CECF),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          AutoSizeText(
            'نسيت كلمة المرور؟',
            style: AppTextStyles.bodySmallSemiBold13.copyWith(
              color: AppColors.green1_600,
            ),
          ),
          SizedBox(height: 33.h),
          CusstomButton(
            buttonText: 'تسجيل دخول',
            textStyle: AppTextStyles.bodyBasaBold16,
            onPressed: () {
              if (context.read<LoginCubit>().formKey.currentState!.validate()) {
                context.read<LoginCubit>().login();
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
 */
