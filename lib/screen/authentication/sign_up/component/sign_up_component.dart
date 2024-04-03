import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/screen/authentication/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';

class SignUpComponent extends StatefulWidget {
  const SignUpComponent({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpComponentState();
  }
}

class SignUpComponentState extends State<SignUpComponent> {
  bool obscureText = true;
  bool obscureConfirmText = true;
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
          text: 'create_account'.tr(),
        ),
        CommonTextWidget(
          top: size.height * zero002,
          textAlign: TextAlign.center,
          text: 'create_account_desc'.tr(),
        ),
        commonTextField(
          top: size.height * zero006,
        ),
        commonTextField(
            top: size.height * zero002,
            suffixIcon: commonInkWell(
                child: !obscureText
                    ? commonIcon(icon: Icons.visibility, color: colorButtons)
                    : commonIcon(
                        icon: Icons.visibility_off, color: colorButtons),
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                }),
            obscureText: obscureText,
            title: 'password'.tr(),
            hint: 'password'.tr(),
            isPassword: true),
        commonTextField(
            top: size.height * zero002,
            suffixIcon: commonInkWell(
                child: !obscureConfirmText
                    ? commonIcon(icon: Icons.visibility, color: colorButtons)
                    : commonIcon(
                        icon: Icons.visibility_off, color: colorButtons),
                onTap: () {
                  setState(() {
                    obscureConfirmText = !obscureConfirmText;
                  });
                }),
            obscureText: obscureConfirmText,
            title: 'confirm_password'.tr(),
            hint: 'confirm_password'.tr(),
            isPassword: true),
        CommonButtonWidget(
          colorButton: colorButtons,
          onPressed: onClickSignUp,
          left: size.width * zero001,
          top: size.height * zero004,
          right: size.width * zero001,
          text: 'sing_up'.tr(),
        ),
        SizedBox(
          height: size.height * zero002,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTextWidget(
              text: 'already_account'.tr(),
            ),
            commonInkWell(
              onTap: onClickAlready,
              child: CommonTextWidget(
                text: 'login'.tr(),
                fontWeight: FontWeight.w600,
                textColor: colorButtons,
                left: five,
              ),
            )
          ],
        )
      ],
    );
  }

  onClickSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  onClickAlready() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
