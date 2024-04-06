import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/common/validator.dart';
import 'package:emi_calculation/firebase/authentication_service.dart';
import 'package:emi_calculation/firebase/firebase_exceptions.dart';
import 'package:emi_calculation/screen/authentication/login/login_screen.dart';
import 'package:emi_calculation/screen/authentication/sign_up/email_verification_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _authService = AuthenticationService();
  bool obscureText = true;
  bool obscureConfirmText = true;
  bool _isLoading = false;
  final key = GlobalKey<FormState>();
  final tetEmail = TextEditingController();
  final tetName = TextEditingController();
  final tetPassword = TextEditingController();
  final tetConfirmPassword = TextEditingController();
  final authService = AuthenticationService();
  @override
  void dispose() {
    tetEmail.dispose();
    tetPassword.dispose();
    tetConfirmPassword.dispose();
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
      child: Stack(
        children: [
          Column(
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
                controller: tetName,
                top: size.height * zero006,
                validator: (value) => Validator.fullNameValidate(value ?? ""),
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.sentences,
                title: "Name",
              ),
              commonTextField(
                controller: tetEmail,
                top: size.height * zero002,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                validator: (value) => Validator.validateEmail(value ?? ""),
              ),
              commonTextField(
                  controller: tetPassword,
                  textInputLength: 30,
                  validator: (value) {
                    if (value.toString().trim().isEmpty) {
                      return 'empty_password'.tr();
                    }

                    if (!Validator.validatePassword(value.toString())) {
                      return 'password_valid_msg'.tr();
                    }
                    return null;
                  },
                  top: size.height * zero002,
                  suffixIcon: commonInkWell(
                      child: !obscureText
                          ? commonIcon(
                              icon: Icons.visibility, color: colorButtons)
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
                  textInputLength: 30,
                  controller: tetConfirmPassword,
                  top: size.height * zero002,
                  validator: (value) {
                    if (value.toString().trim().isEmpty) {
                      return 'empty_confirm_password'.tr();
                    }

                    if (!Validator.validatePassword(value.toString())) {
                      return 'password_valid_msg'.tr();
                    }
                    if (!tetPassword.text.contains(value.toString())) {
                      return 'password_not_match'.tr();
                    }
                    return null;
                    //  Validator.validatePassword(value ?? "");
                  },
                  suffixIcon: commonInkWell(
                      child: !obscureConfirmText
                          ? commonIcon(
                              icon: Icons.visibility, color: colorButtons)
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
          ),
          _isLoading
              ? Align(
                  alignment: Alignment.center,
                  child: showLoaderList(),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  onClickSignUp() async {
    if (key.currentState!.validate()) {
      final status = await _authService.createAccount(
        email: tetEmail.text.trim(),
        password: tetPassword.text,
        name: tetName.text,
      );
      setState(() {
        _isLoading = true;
      });
      if (status == AuthStatus.successful) {
        setState(() {
          _isLoading = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const EmailVerificationScreen()));
      } else {
        setState(() {
          _isLoading = false;
        });
        final error = AuthExceptionHandler.generateErrorMessage(status);
        showErrorMsg(
          msg: error,
        );
      }
    }
  }

  void showErrorMsg({String? msg}) {
    showMessageDialog(context: context, title: "Error", content: msg);
  }

  onClickAlready() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
