import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/screen/authentication/change_password/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationComponent extends StatefulWidget {
  const VerificationComponent({super.key});

  @override
  State<StatefulWidget> createState() {
    return VerificationComponentState();
  }
}

class VerificationComponentState extends State<VerificationComponent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.all(eighteen),
      width: size.width,
      height: size.height,
      child: optView(size: size),
    );
  }

  optView({required Size size}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonTextWidget(
          fontSize: twenty,
          fontWeight: FontWeight.w800,
          text: 'verify_code'.tr(),
        ),
        CommonTextWidget(
          top: size.height * zero002,
          textAlign: TextAlign.center,
          text: 'verify_code_desc'.tr(),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.only(top: fiftyFive),
            alignment: Alignment.center,
            width: size.width * zero07,
            child: PinCodeTextField(
              length: 4,
              obscureText: false,

              animationType: AnimationType.fade,
              cursorColor: colorBlue,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(fifteen),
                fieldHeight: sixty,
                fieldWidth: sixty,
                borderWidth: four,
                selectedColor: colorButtons,
                activeBorderWidth: zero05,
                disabledBorderWidth: zero05,
                inactiveBorderWidth: zero05,
                activeColor: colorWhite,
                inactiveColor: Colors.grey,
                activeFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              textStyle: commonTextStyle(
                  textColor: Colors.white,
                  fontSize: fourteen,
                  fontWeight: FontWeight.w600),
              enableActiveFill: false,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              //    controller: tetOTP,
              onCompleted: (v) {
                // if (kDebugMode) {
                //   print("Completed");
                // }
                // setState(() {
                //   isCompleted = true;
                // });
              },
              onChanged: (value) {
                // if (kDebugMode) {
                //   print(value);
                // }
                setState(() {
                  //otpCode = value;
                });
              },
              beforeTextPaste: (text) {
                // if (kDebugMode) {
                //   print("Allowing to paste $text");
                // }
                return true;
              },
              appContext: context,
            ),
          ),
        ),
        CommonButtonWidget(
          onPressed: onClickVerify,
          left: size.width * zero001,
          top: size.height * zero004,
          right: size.width * zero001,
          text: 'verify'.tr(),
        ),
      ],
    );
  }

  onClickVerify() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
  }
}
