import 'package:emi_calculation/core/common/validator.dart';
import 'package:emi_calculation/firebase/authentication_service.dart';
import 'package:emi_calculation/firebase/firebase_exceptions.dart';
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
  final key = GlobalKey<FormState>();
  final tetEmail = TextEditingController();
  final authService = AuthenticationService();
  bool _isLoading = false;
  @override
  void dispose() {
    tetEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.all(eighteen),
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          ListView(
            children: [
              signUpView(size: size),
            ],
          ),
          _isLoading ? showLoaderList() : const SizedBox.shrink(),
        ],
      ),
    );
  }

  signUpView({required Size size}) {
    return Form(
      key: key,
      child: Column(
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
            keyboardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none,
            validator: (value) => Validator.validateEmail(value ?? ""),
            controller: tetEmail,
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
      ),
    );
  }

  onClickReset() async {
    if (key.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final status =
          await authService.resetPassword(email: tetEmail.text.trim());
      if (status == AuthStatus.successful) {
        setState(() {
          _isLoading = false;
        });
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
        //Navigator.pushNamed(context, LoginScreen.id);
      } else {
        setState(() {
          _isLoading = false;
        });
        final error = AuthExceptionHandler.generateErrorMessage(status);
        if (!mounted) return;
        showMessageDialog(context: context, title: "error", content: error);
      }
    }
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const VerificationScreen()));
  }

  void showErrorMsg({String? msg}) {
    showMessageDialog(context: context, title: "Error", content: msg);
  }
}
