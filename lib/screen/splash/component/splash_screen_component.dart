import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:flutter/material.dart';

class SplashScreenComponent extends StatelessWidget {
  const SplashScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        commonSetAssetImage(
          height: size.height * zero04,
          width: size.width * zero04,
        ),
      ],
    );
  }
}
