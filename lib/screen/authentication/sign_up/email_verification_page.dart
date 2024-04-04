import 'dart:async';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/firebase/firebase_constants.dart';
import 'package:emi_calculation/screen/dashboard/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
          (route) => false);

      timer?.cancel();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return commonBgView(
      context: context,
      child: isEmailVerified
          ? Center(
              child: CommonTextWidget(
                fontWeight: FontWeight.w700,
                text: "Email Successfully Verified",
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CommonTextWidget(
                    textAlign: TextAlign.center,
                    text: 'Check your Email',
                    fontSize: twenty,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CommonTextWidget(
                  textAlign: TextAlign.center,
                  top: size.height * 0.020,
                  text:
                      'We have sent you a Email on  ${auth.currentUser?.email}',
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: size.height * 0.040,
                ),
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
                SizedBox(
                  height: size.height * 0.040,
                ),
                CommonTextWidget(
                  text: 'Verifying email....',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.040,
                ),
                CommonButtonWidget(
                  text: 'Resend',
                  width: size.width * 0.5,
                  onPressed: () {
                    try {
                      FirebaseAuth.instance.currentUser
                          ?.sendEmailVerification();
                    } catch (e) {
                      debugPrint('$e');
                    }
                  },
                ),
              ],
            ),
    );
  }
}
