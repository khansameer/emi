import 'package:emi_calculation/core/common/common_component.dart';
import 'package:flutter/material.dart';

import 'component/change_password_component.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ChangePasswordScreenState();
  }
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return commonBgView(
        context: context, child: const ChangePasswordComponent());
  }
}
