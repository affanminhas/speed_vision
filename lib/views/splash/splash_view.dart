import 'package:flutter/material.dart';
import 'package:speed_vision/constant/color_palete.dart';
import 'package:speed_vision/constant/strings.dart';
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
      backgroundColor: ColorPalette.primaryColor,
      body: PopScope(
        canPop: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(Strings.mainLogo),
            ),
          ],
        ),
      ),
    );
  }
}
