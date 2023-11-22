import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_vision/constant/color_palete.dart';
import 'package:speed_vision/constant/spacing.dart';
import 'package:speed_vision/constant/typography.dart';
import 'package:speed_vision/controllers/auth_controller.dart';
import 'package:speed_vision/mixins/validation_mixin.dart';
import 'package:speed_vision/shared/custom_buttons.dart';
import 'package:speed_vision/shared/custom_text_field.dart';
import 'package:speed_vision/views/auth/reset_password/reset_password_view.dart';
import 'package:speed_vision/views/dashboard/dashboard_view.dart';

class LoginView extends StatefulWidget {
  static const String id = '/login-view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with ValidationMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find<AuthController>();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _authController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return SafeArea(
            child: Center(
              child: Form(
                key: _formKey,
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
                      CustomTextField(
                        hintText: 'Email',
                        controller: _emailController,
                        validator: validateEmail,
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                      const VerticalSpacing(15),
                      CustomTextField(
                        hintText: 'Password',
                        validator: (value) => validateFormField(value, 'Please enter your password'),
                        controller: _passwordController,
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
                      authController.loading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  _authController.login(_emailController.text, _passwordController.text);
                                }
                                //Navigator.pushNamed(context, DashboardView.id);
                              },
                              title: 'Login',
                            ),
                      const VerticalSpacing(30),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
