import 'package:flutter/material.dart';
import 'package:speed_vision/constant/color_palete.dart';
import 'package:speed_vision/constant/typography.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      body: SafeArea(
        child: Center(
          child: Text(
            'Notification View',
            style: poppinsRegular.copyWith(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
