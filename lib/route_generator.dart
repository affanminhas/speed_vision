import 'package:flutter/material.dart';
import 'package:speed_vision/base/app_view.dart';
import 'package:speed_vision/views/auth/login/login_view.dart';
import 'package:speed_vision/views/splash/splash_view.dart';

import 'views/auth/reset_password/email_sent_view.dart';
import 'views/auth/reset_password/reset_password_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppView.id:
        return MaterialPageRoute(builder: (_) => const AppView(), settings: const RouteSettings(name: 'AppView'));
      case SplashView.id:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case LoginView.id:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case ResetPasswordView.id:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case EmailSentView.id:
        return MaterialPageRoute(builder: (_) => const EmailSentView());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(body: Center(child: Text('No Route Defined')));
          },
        );
    }
  }
}
