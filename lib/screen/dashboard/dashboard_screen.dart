import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/ModelTheme.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/core/image_path/image_path.dart';
import 'package:emi_calculation/screen/dashboard/component/bank_selection_component.dart';
import 'package:emi_calculation/screen/dashboard/component/emi_selection_component.dart';
import 'package:emi_calculation/screen/dashboard/component/kyc_component.dart';
import 'package:emi_calculation/screen/dashboard/component/step_one_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return commonBgView(
        actions: [
          commonSetAssetImage(image: icLogOut, width: thirty, height: thirty),
          const SizedBox(
            width: fifteen,
          ),
          commonSetAssetImage(image: icLogOut, width: thirty, height: thirty),
          const SizedBox(
            width: fifteen,
          ),
        ],
        context: context,
        child: Scaffold(
          bottomSheet: commonInkWell(
            onTap: () {
              showModalBottomSheetDialog(
                  context: context,
                  size: size,
                  widget: StepOneComponent(
                    size: size,
                    onTap: () {
                      showModalBottomSheetDialog(
                          context: context,
                          size: size,
                          widget: SizedBox(
                            height: size.height * 0.8,
                            child: EmiSelectionComponent(
                              size: size,
                              onTap: () {
                                showModalBottomSheetDialog(
                                    context: context,
                                    size: size,
                                    widget: SizedBox(
                                      height: size.height * 0.7,
                                      child: BankSelectionComponent(
                                        size: size,
                                        onTap: () {
                                          showModalBottomSheetDialog(
                                              context: context,
                                              size: size,
                                              widget: SizedBox(
                                                width: size.width,
                                                height: size.height * 0.6,
                                                child: KycComponent(
                                                  size: size,
                                                  onTap: () {},
                                                ),
                                              ));
                                        },
                                      ),
                                    ));
                              },
                            ),
                          ));
                    },
                  ));
            },
            child: Container(
              height: ninety,
              decoration: BoxDecoration(
                  color: colorButtons, borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: CommonTextWidget(
                  text: 'apply_loan'.tr(),
                  fontWeight: FontWeight.w600,
                  fontSize: sixteen,
                ),
              ),
            ),
          ),
        ));
  }

  void showEmiDialog({required Size size}) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: size.height * 0.7,
          child: Center(
            child: EmiSelectionComponent(
              size: size,
            ),
          ),
        );
      },
    );
  }
}
