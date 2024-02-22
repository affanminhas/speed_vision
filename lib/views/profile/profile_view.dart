import 'package:flutter/material.dart';
import 'package:speed_vision/constant/color_palete.dart';
import 'package:speed_vision/constant/typography.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      body: SafeArea(
        child: Center(
          child: Text(
            'Profile View',
            style: poppinsRegular.copyWith(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
