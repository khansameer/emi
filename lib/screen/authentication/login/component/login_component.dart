import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/core/string_utils/string_utils.dart';
import 'package:emi_calculation/screen/authentication/forgot_password/forgot_password_screen.dart';
import 'package:emi_calculation/screen/authentication/sign_up/sign_up_screen.dart';
import 'package:emi_calculation/screen/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginComponentState();
  }
}

class LoginComponentState extends State<LoginComponent> {
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
          loginView(size: size),
        ],
      ),
    );
  }

  loginView({required Size size}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonTextWidget(
          fontSize: twenty,
          fontWeight: FontWeight.w800,
          text: 'login_title'.tr(),
        ),
        CommonTextWidget(
          top: size.height * zero002,
          textAlign: TextAlign.center,
          text: 'login_desc'.tr(),
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
        Align(
          alignment: Alignment.centerRight,
          child: commonInkWell(
            onTap: onClickForgot,
            child: CommonTextWidget(
              top: size.height * zero002,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              text: 'forgot_password'.tr(),
            ),
          ),
        ),
        CommonButtonWidget(
          colorButton: colorButtons,
          onPressed: onClickLogin,
          left: size.width * zero001,
          top: size.height * zero004,
          right: size.width * zero001,
          text: 'login'.tr(),
        ),
        SizedBox(
          height: size.height * zero002,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTextWidget(
              text: 'an_account'.tr(),
            ),
            commonInkWell(
              onTap: onClickSignup,
              child: CommonTextWidget(
                text: 'sing_up'.tr(),
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

  onClickSignup() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  onClickForgot() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
  }

  onClickLogin() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()));
  }
}
