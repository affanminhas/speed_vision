import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:speed_vision/constant/app_images.dart';
import 'package:speed_vision/constant/typography.dart';
import 'package:speed_vision/views/auth/login/login_view.dart';

class SplashView extends StatefulWidget {
  static const String id = '/splash-view';

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () async {
        Navigator.pushReplacementNamed(context, LoginView.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(Images.logo, height: 250),
            ),
            Text(
              'Speed Vision',
              style: poppinsRegular.copyWith(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
