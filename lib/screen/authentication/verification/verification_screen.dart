import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'component/verification_component.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return VerificationScreenState();
  }
}

class VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    changeStatusBarTextColor(style: SystemUiOverlayStyle.dark);
    return commonBgView(context: context, child: const VerificationComponent());
  }
}
