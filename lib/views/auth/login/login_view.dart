import 'package:flutter/material.dart';
import 'package:speed_vision/constant/color_palete.dart';
import 'package:speed_vision/constant/spacing.dart';
import 'package:speed_vision/constant/typography.dart';
import 'package:speed_vision/shared/custom_buttons.dart';
import 'package:speed_vision/shared/custom_text_field.dart';
import 'package:speed_vision/views/auth/reset_password/reset_password_view.dart';

class LoginView extends StatefulWidget {
  static const String id = '/login-view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VerticalSpacing(20),
                Text('Hey admin,', style: poppinsRegular.copyWith(fontSize: 16)),
                const VerticalSpacing(5),
                Text('Welcome Back', style: poppinsBold.copyWith(fontSize: 20)),
                const VerticalSpacing(30),
                const CustomTextField(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                const VerticalSpacing(15),
                CustomTextField(
                  hintText: 'Password',
                  isPassword: !isPasswordVisible,
                  suffixIcon: isPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye,
                  isSuffixIcon: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  onSuffixIconPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                const VerticalSpacing(10),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, ResetPasswordView.id),
                  child: Text(
                    'Forgot your password?',
                    style: poppinsMedium.copyWith(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      color: ColorPalette.greyText1,
                    ),
                  ),
                ),
                const Spacer(),
                CustomElevatedButton(
                  onPressed: () {},
                  title: 'Login',
                ),
                const VerticalSpacing(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
