import 'package:flutter/material.dart';
import 'package:speed_vision/constant/color_palete.dart';
import 'package:speed_vision/constant/typography.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      body: SafeArea(
        child: Center(
          child: Text(
            'Explore View',
            style: poppinsRegular.copyWith(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
