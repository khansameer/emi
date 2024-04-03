import 'package:emi_calculation/screen/authentication/verification/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/screen/authentication/login/login_screen.dart';

import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';

class ForgotPasswordComponent extends StatefulWidget {
  const ForgotPasswordComponent({super.key});

  @override
  State<StatefulWidget> createState() {
    return ForgotPasswordComponentState();
  }
}

class ForgotPasswordComponentState extends State<ForgotPasswordComponent> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.all(eighteen),
      width: size.width,
      height: size.height,
      child: ListView(
        children: [
          signUpView(size: size),
        ],
      ),
    );
  }

  signUpView({required Size size}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonTextWidget(
          fontSize: twenty,
          fontWeight: FontWeight.w800,
          text: 'forgot_password'.tr(),
        ),
        CommonTextWidget(
          top: size.height * zero002,
          textAlign: TextAlign.center,
          text: 'forgot_password_desc'.tr(),
        ),
        commonTextField(
          top: size.height * zero006,
        ),
        CommonButtonWidget(
          colorButton: colorButtons,
          onPressed: onClickReset,
          left: size.width * zero001,
          top: size.height * zero004,
          right: size.width * zero001,
          text: 'reset_password'.tr(),
        ),
      ],
    );
  }

  onClickReset() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const VerificationScreen()));
  }
}
