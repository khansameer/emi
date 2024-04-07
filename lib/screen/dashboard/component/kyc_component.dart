import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/core/image_path/image_path.dart';

import 'package:flutter/material.dart';

//ignore: must_be_immutable
class KycComponent extends StatefulWidget {
  KycComponent(
      {super.key, required this.size, this.onTap, required this.function});
  Size size;
  VoidCallback? onTap;
  Function function;
  @override
  State<StatefulWidget> createState() {
    return KycComponentState();
  }
}

class KycComponentState extends State<KycComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: widget.size.height * 0.030,
              ),
              Padding(
                padding: const EdgeInsets.only(left: fifteen, right: fifteen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidget(
                      textColor: Colors.black,
                      left: ten,
                      fontSize: eighteen,
                      textStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: sixteen,
                              ),
                      fontWeight: FontWeight.w600,
                      text: 'kyc_completed'.tr(),
                    ),
                    CommonTextWidget(
                      top: five,
                      fontWeight: FontWeight.w500,
                      left: ten,
                      textColor: Colors.grey,
                      text: 'kyc_completed_desc'.tr(),
                    ),
                    SizedBox(
                      height: widget.size.height * 0.06,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        icDone,
                        width: oneHundred,
                        height: oneHundred,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CommonButtonWidget(
                        radius: twentyFour,
                        onPressed: () {
                          widget.function(false);
                          Navigator.of(context).pop();
                        },
                        top: widget.size.height * 0.040,
                        width: widget.size.width * 0.4,
                        colorButton: Colors.white,
                        colorText: Colors.black,
                        colorBorder: Colors.black,
                        text: 'done'.tr(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
