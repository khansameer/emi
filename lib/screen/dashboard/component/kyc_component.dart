import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/core/image_path/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class KycComponent extends StatefulWidget {
  KycComponent({super.key, required this.size, this.onTap});
  Size size;
  VoidCallback? onTap;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return KycComponentState();
  }
}

class KycComponentState extends State<KycComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Container(
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: widget.size.height * zero0040,
              ),
              Padding(
                padding: const EdgeInsets.only(left: fifteen, right: fifteen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidget(
                      textColor: Colors.black,
                      fontSize: eighteen,
                      fontWeight: FontWeight.w600,
                      text: 'kyc_completed'.tr(),
                    ),
                    CommonTextWidget(
                      top: five,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey,
                      text: 'kyc_completed_desc'.tr(),
                    ),
                    SizedBox(
                      height: widget.size.height * 0.04,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        icDone,
                        width: 130,
                        height: 130,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CommonButtonWidget(
                        radius: twentyFour,
                        top: widget.size.height * zero0024,
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
