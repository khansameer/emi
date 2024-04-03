import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class StepOneComponent extends StatefulWidget {
  StepOneComponent({super.key, required this.size, this.onTap});
  Size size;
  VoidCallback? onTap;
  @override
  State<StatefulWidget> createState() {
    return StepOneViewState();
  }
}

class StepOneViewState extends State<StepOneComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: commonInkWell(
        onTap: widget.onTap,
        child: Container(
          height: ninety,
          decoration: BoxDecoration(
              color: colorButtons, borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: CommonTextWidget(
              text: 'emi_selection'.tr(),
              fontWeight: FontWeight.w600,
              fontSize: sixteen,
            ),
          ),
        ),
      ),
      body: Card(
        elevation: 10,
        color: Colors.white,
        shadowColor: Colors.grey,
        surfaceTintColor: Colors.white,
        child: Container(
          color: Colors.white,
          height: widget.size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: widget.size.height * zero0040,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.question_mark,
                        color: Colors.black,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: fifteen, right: fifteen),
                child: Column(
                  children: [
                    CommonTextWidget(
                      textColor: Colors.black,
                      fontSize: eighteen,
                      fontWeight: FontWeight.w600,
                      text: "vilash, how much money do you need?",
                    ),
                    CommonTextWidget(
                      top: five,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey,
                      text:
                          "move the dial and set any amount you need upto\nき5,00,000",
                    ),
                    SizedBox(
                      height: widget.size.height * zero007,
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: twoHundredFifty,
                                height: twoHundredFifty,
                                child: SfRadialGauge(axes: <RadialAxis>[
                                  RadialAxis(
                                    minimum: 0,
                                    maximum: 100,
                                    showLabels: false,
                                    annotations: <GaugeAnnotation>[
                                      GaugeAnnotation(
                                          positionFactor: zero01,
                                          widget: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CommonTextWidget(
                                                  fontWeight: FontWeight.w500,
                                                  textColor: Colors.grey,
                                                  text: 'credit_amount'.tr(),
                                                ),
                                                CommonTextWidget(
                                                  top: five,
                                                  fontWeight: FontWeight.w800,
                                                  textColor: Colors.black,
                                                  text: "₽ 1,50,000",
                                                ),
                                                CommonTextWidget(
                                                  top: five,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  textColor: Colors.green,
                                                  text: "@1.04% monthly",
                                                ),
                                              ],
                                            ),
                                          ))
                                    ],
                                    pointers: const <GaugePointer>[
                                      RangePointer(
                                        value: fifty,
                                        color: colorProgressValue,
                                        cornerStyle: CornerStyle.bothCurve,
                                        width: zero02,
                                        sizeUnit: GaugeSizeUnit.factor,
                                      )
                                    ],
                                    showTicks: false,
                                    axisLineStyle: const AxisLineStyle(
                                      thickness: zero02,
                                      cornerStyle: CornerStyle.bothCurve,
                                      color: colorProgress,
                                      thicknessUnit: GaugeSizeUnit.factor,
                                    ),
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CommonTextWidget(
                      textColor: Colors.grey,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      text:
                          "cstash is instant. money will be delivered\nwithin seconds",
                    ),
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
