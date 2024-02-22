import 'package:flutter/material.dart';
import 'package:speed_vision/constant/color_palete.dart';
import 'package:speed_vision/constant/spacing.dart';
import 'package:speed_vision/constant/typography.dart';
import 'package:speed_vision/shared/custom_appbar.dart';
import 'package:speed_vision/shared/custom_buttons.dart';
import 'package:speed_vision/shared/custom_text_field.dart';
import 'package:speed_vision/views/auth/reset_password/email_sent_view.dart';

class ResetPasswordView extends StatelessWidget {
  static const String id = '/reset-password';

  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      appBar: CustomAppBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Reset Password', style: poppinsBold.copyWith(fontSize: 20, color: Colors.white)),
              const VerticalSpacing(10),
              Text(
                "Enter the email associated with your account and we'll send an email with instruction to reset password",
                style: poppinsRegular.copyWith(fontSize: 15, color: ColorPalette.greyShade600),
              ),
              const VerticalSpacing(30),
              const CustomTextField(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              const VerticalSpacing(20),
              CustomElevatedButton(
                textStyle: poppinsRegular.copyWith(fontSize: 16, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, EmailSentView.id);
                },
                title: 'Send Instruction',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
