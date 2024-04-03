import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/screen/authentication/login/login_screen.dart';
import 'package:flutter/material.dart';

class ChangePasswordComponent extends StatefulWidget {
  const ChangePasswordComponent({super.key});

  @override
  State<StatefulWidget> createState() {
    return ChangePasswordComponentState();
  }
}

class ChangePasswordComponentState extends State<ChangePasswordComponent> {
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonTextWidget(
              fontSize: twenty,
              fontWeight: FontWeight.w800,
              text: 'change_password'.tr(),
            ),
            CommonTextWidget(
              top: size.height * zero002,
              textAlign: TextAlign.center,
              text: 'change_password_desc'.tr(),
            ),
            commonTextField(
                top: size.height * zero003,
                suffixIcon: commonInkWell(
                    child: !obscureText
                        ? commonIcon(icon: Icons.visibility, color: Colors.grey)
                        : commonIcon(
                            icon: Icons.visibility_off, color: Colors.grey),
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
                        ? commonIcon(icon: Icons.visibility, color: Colors.grey)
                        : commonIcon(
                            icon: Icons.visibility_off, color: Colors.grey),
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
              onPressed: onClickSave,
              left: size.width * zero001,
              top: size.height * zero004,
              right: size.width * zero001,
              text: 'save_change'.tr(),
            ),
          ],
        ),
      ),
    );
  }

  onClickSave() {
    showMessageDialog(
        context: context,
        title: 'success'.tr(),
        onTapClose: onClickClose,
        content: 'change_password_msg'.tr());
  }

  onClickClose() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}
