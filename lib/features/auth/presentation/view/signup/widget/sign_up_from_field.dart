import 'package:e_commerce/features/auth/presentation/view/signup/widget/field_sigin_up.dart';
import 'package:e_commerce/features/auth/presentation/view/signup/widget/pick_image_widget.dart';
import 'package:e_commerce/features/auth/presentation/view/signup/widget/sign_up_button.dart';
import 'package:e_commerce/features/auth/presentation/view/signup/widget/terms_and_conitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpFromField extends ConsumerStatefulWidget {
  const SignUpFromField({super.key});

  @override
  ConsumerState<SignUpFromField> createState() => _SignUpFromFieldState();
}

class _SignUpFromFieldState extends ConsumerState<SignUpFromField> {
  bool isObscureText = true;
  bool isTermsAccepted = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16.h,
        children: [
          PickImageWidget(),
          FieldName(nameController: nameController),
          FieldEmail(emailController: emailController),
          FieldPhone(phoneController: phoneController),
          FieldPassword(
            passwordController: passwordController,
            isObscureText: isObscureText,
            onObscureTextChanged: (value) {
              setState(() {
                isObscureText = value;
              });
            },
          ),
          TermsAndConitions(
            isTermsAccepted: isTermsAccepted,
            onChecked: (value) {
              setState(() {
                isTermsAccepted = value;
              });
            },
          ),
          SignUpButton(
            isTermsAccepted: isTermsAccepted,
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
            phoneController: phoneController,
            formKey: _formKey,
            autovalidateMode: autovalidateMode,
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

//~ using this firebase and cubit

/*          import 'package:e_commerce/core/helper_functions/build_error_message.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/widget/app_text_form_field.dart';
import 'package:e_commerce/core/widget/cusstom_button.dart';
import 'package:e_commerce/features/auth/presentation/manger/sign_up/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/signup/widget/terms_and_conitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpFromField extends StatefulWidget {
  const SignUpFromField({super.key});

  @override
  State<SignUpFromField> createState() => _SignUpFromFieldState();
}

class _SignUpFromFieldState extends State<SignUpFromField> {
  bool isObscureText = true;
  bool isTermsAccepted = false;
  @override
  void initState() {
    super.initState();

    isTermsAccepted = false;
  }

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'الاسم كامل',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'رجاء ادخال الاسم كامل';
              }
              return null;
            },
            controller: context.read<SignUpCubit>().nameContoller,
          ),
          SizedBox(height: 16.h),
          AppTextFormField(
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'رجاء ادخال البريد الإلكتروني';
              }
              return null;
            },
            controller: context.read<SignUpCubit>().emailContoller,
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
            controller: context.read<SignUpCubit>().passwordContoller,
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
          TermsAndConitions(
            isTermsAccepted: isTermsAccepted,
            onChecked: (value) {
              setState(() {
                isTermsAccepted = value;
              });
            },
          ),
          SizedBox(height: 16.h),
          CusstomButton(
            buttonText: 'إنشاء حساب جديد',
            textStyle: AppTextStyles.bodyBasaBold16,
            onPressed: isTermsAccepted
                ? () {
                    if (context
                        .read<SignUpCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context
                          .read<SignUpCubit>()
                          .createUserwithEmailandPassword();
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  }
                : () {
                    if (context
                        .read<SignUpCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      buildErrorBar(context, 'يحب ان تقبل الشروط والاحكام');
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
            backgroundColor: isTermsAccepted ? null : AppColors.grayscale300,
          ),
        ],
      ),
    );
  }
}
*/
