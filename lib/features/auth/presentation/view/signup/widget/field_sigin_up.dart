import 'package:e_commerce/core/widget/app_text_form_field.dart';
import 'package:flutter/material.dart';

class FieldPassword extends StatelessWidget {
  const FieldPassword({
    super.key,
    required this.passwordController,
    required this.isObscureText,
    required this.onObscureTextChanged,
  });

  final TextEditingController passwordController;
  final bool isObscureText;
  final ValueChanged<bool> onObscureTextChanged;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'كلمة المرور',
      validator: (value) =>
          value == null || value.isEmpty ? 'رجاء ادخال كلمة المرور' : null,
      controller: passwordController,
      isObscureText: isObscureText,
      keyboardType: TextInputType.visiblePassword,
      maxlines: 1,
      suffixIcon: GestureDetector(
        onTap: () {
          onObscureTextChanged(!isObscureText); // Toggle visibility
        },
        child: Icon(
          isObscureText ? Icons.visibility_off : Icons.visibility,
          color: const Color(0xffC9CECF),
        ),
      ),
    );
  }
}

class FieldName extends StatelessWidget {
  const FieldName({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'الاسم كامل',
      validator: (value) =>
          value == null || value.isEmpty ? 'رجاء ادخال الاسم كامل' : null,
      controller: nameController,
    );
  }
}

class FieldEmail extends StatelessWidget {
  const FieldEmail({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'البريد الإلكتروني',
      keyboardType: TextInputType.emailAddress,
      validator: (value) => value == null || value.isEmpty
          ? 'رجاء ادخال البريد الإلكتروني'
          : null,
      controller: emailController,
    );
  }
}

class FieldPhone extends StatelessWidget {
  const FieldPhone({
    super.key,
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'رقم الهاتف',
      keyboardType: TextInputType.phone,
      validator: (value) =>
          value == null || value.isEmpty ? 'رجاء ادخال رقم الهاتف' : null,
      controller: phoneController,
    );
  }
}
