import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/core/string_utils/string_utils.dart';
import 'package:emi_calculation/screen/dashboard/component/bank_selection_component.dart';
import 'package:emi_calculation/screen/dashboard/component/emi_selection_component.dart';
import 'package:emi_calculation/screen/dashboard/component/kyc_component.dart';
import 'package:emi_calculation/screen/dashboard/model/emi_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class StepOneComponent extends StatefulWidget {
  StepOneComponent({
    super.key,
    required this.size,
    required this.model,
  });
  Size size;

  EMIModel model;
  @override
  State<StatefulWidget> createState() {
    return StepOneViewState();
  }
}

class StepOneViewState extends State<StepOneComponent> {
  double _volumeValue = 0.0;

  void onVolumeChanged(double value) {
    setState(() {
      _volumeValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
    _volumeValue = double.parse('${widget.model.recommendedLoan}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: commonInkWell(
        onTap: () {
          showEmiSelection(
              size: widget.size,
              value: _volumeValue.ceil().toString(),
              model: widget.model);
        },
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
                      text: "${widget.model.name}, how much money do you need?",
                    ),
                    CommonTextWidget(
                      top: five,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey,
                      text:
                          "move the dial and set any amount you need upto\n$rupee${widget.model.maxLoan}",
                    ),
                    SizedBox(
                      height: widget.size.height * zero007,
                    ),
                    SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                        minimum: double.parse('${widget.model.minLoan}'),
                        maximum: double.parse('${widget.model.maxLoan}'),
                        showLabels: false,
                        interval: 1,
                        showFirstLabel: false,
                        startAngle: 270,
                        endAngle: 270,
                        showTicks: false,
                        radiusFactor: 0.8,
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              positionFactor: zero01,
                              widget: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                      text:
                                          '$rupee ${_volumeValue.ceil().toString()}',
                                    ),
                                    CommonTextWidget(
                                      top: five,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      textColor: Colors.green,
                                      text:
                                          "@ ${widget.model.interestRate}% monthly",
                                    ),
                                  ],
                                ),
                              ))
                        ],
                        axisLineStyle: const AxisLineStyle(
                            cornerStyle: CornerStyle.bothFlat,
                            color: colorProgress,
                            thickness: 20),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: _volumeValue,
                            width: 20,
                            cornerStyle: CornerStyle.bothCurve,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                            color: colorProgressValue,
                          ),
                          MarkerPointer(
                              value: _volumeValue,
                              enableDragging: true,
                              onValueChanged: onVolumeChanged,
                              markerHeight: 15,
                              markerWidth: 15,
                              markerType: MarkerType.circle,
                              color: Colors.white,
                              borderWidth: 2,
                              borderColor: Colors.white54)
                        ],
                      )
                    ]),
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

  void showEmiSelection(
      {required Size size, required String value, required EMIModel model}) {
    showModalBottomSheetDialog(
        context: context,
        size: size,
        widget: SizedBox(
          height: size.height * 0.8,
          child: EmiSelectionComponent(
            emiAmount: value,
            size: size,
            model: model,
            onTap: () {
              showModalBottomSheetDialog(
                  context: context,
                  size: size,
                  widget: SizedBox(
                    height: size.height * 0.7,
                    child: BankSelectionComponent(
                      size: size,
                      model: model,
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
  }
}
