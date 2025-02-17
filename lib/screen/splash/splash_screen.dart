import 'dart:async';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/preference_helper.dart';
import 'package:emi_calculation/core/route.dart';
import 'package:emi_calculation/screen/authentication/login/login_screen.dart';
import 'package:emi_calculation/screen/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'component/splash_screen_component.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoNextScreen();
  }

  void gotoNextScreen() {
    Timer(const Duration(seconds: 3), () async {
      if (await PreferenceHelper.getBool(key: PreferenceHelper.isLOGIN) ==
          true) {
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.dashboard, (route) => false);
      } else {
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.login, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusBarTextColor(style: SystemUiOverlayStyle.light);
    return const Scaffold(
      backgroundColor: colorApp,
      body: Center(
        child: SplashScreenComponent(),
      ),
    );
  }
}
