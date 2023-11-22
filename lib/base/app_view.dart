import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_vision/constant/color_palete.dart';
import 'package:speed_vision/domain/bindings/global_bindings.dart';
import 'package:speed_vision/route_generator.dart';
import 'package:speed_vision/views/splash/splash_view.dart';

class AppView extends StatelessWidget {
  static const String id = '/app-view';

  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Speed Vision',
      initialBinding: GlobalBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: ColorPalette.primaryColor,
        )
      ),
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
