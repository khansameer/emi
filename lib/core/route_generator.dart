import 'package:emi_calculation/core/route.dart';
import 'package:emi_calculation/screen/authentication/forgot_password/forgot_password_screen.dart';
import 'package:emi_calculation/screen/authentication/login/login_screen.dart';
import 'package:emi_calculation/screen/authentication/sign_up/sign_up_screen.dart';
import 'package:emi_calculation/screen/authentication/verification/email_verification_page.dart';
import 'package:emi_calculation/screen/dashboard/dashboard_screen.dart';
import 'package:emi_calculation/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
            settings: const RouteSettings(name: RouteName.splashScreen));
      case RouteName.login:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen(),
            settings: const RouteSettings(name: RouteName.login));
      case RouteName.signUp:
        return MaterialPageRoute(
            builder: (_) => const SignUpScreen(),
            settings: const RouteSettings(name: RouteName.signUp));

      case RouteName.forgotPassword:
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordScreen(),
            settings: const RouteSettings(name: RouteName.forgotPassword));

      case RouteName.verification:
        return MaterialPageRoute(
            builder: (_) => const EmailVerificationScreen(),
            settings: const RouteSettings(name: RouteName.verification));
      case RouteName.dashboard:
        return MaterialPageRoute(
            builder: (_) => DashboardScreen(),
            settings: const RouteSettings(name: RouteName.dashboard));

      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
