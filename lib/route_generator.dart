import 'package:flutter/material.dart';
import 'package:speed_vision/base/app_view.dart';
import 'package:speed_vision/views/auth/login/login_view.dart';
import 'package:speed_vision/views/splash/splash_view.dart';

import 'views/auth/reset_password/email_sent_view.dart';
import 'views/auth/reset_password/reset_password_view.dart';
import 'views/dashboard/dashboard_view.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppView.id:
        return MaterialPageRoute(builder: (_) => const AppView(), settings: const RouteSettings(name: 'AppView'));
      case SplashView.id:
        return PageTransition(child: const SplashView(), type: PageTransitionType.rightToLeft);
      case LoginView.id:
        return PageTransition(child: const LoginView(), type: PageTransitionType.rightToLeft);
      case ResetPasswordView.id:
        return PageTransition(child: const ResetPasswordView(), type: PageTransitionType.rightToLeft);
      case EmailSentView.id:
        return PageTransition(child: const EmailSentView(), type: PageTransitionType.rightToLeft);
      case DashboardView.id:
        return PageTransition(child: const DashboardView(), type: PageTransitionType.rightToLeft);
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(body: Center(child: Text('No Route Defined')));
          },
        );
    }
  }
}
