import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/core/string_utils/string_utils.dart';
import 'package:emi_calculation/screen/dashboard/component/emi_selection_component.dart';

import 'package:emi_calculation/screen/dashboard/model/emi_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

//ignore: must_be_immutable
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
  bool _isClick = false;

  void onVolumeChanged(double value) {
    setState(() {
      _volumeValue = value;
    });
  }

  getValue(value) {
    setState(() {
      _isClick = false;
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
          setState(() {});
          _isClick = true;
          showEmiSelection(
              size: widget.size,
              value: _volumeValue.ceil().toString(),
              model: widget.model);
        },
        child: Container(
          height: ninety,
          decoration: boxDecoration(topLeft: twenty, topRight: twenty),
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
        elevation: zero,
        color: Colors.transparent,
        child: Container(
          color: Colors.transparent,
          height: widget.size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: widget.size.height * zero0040,
              ),
              Visibility(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.question_mark,
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: fifteen, right: zero),
                    child: Column(
                      children: [
                        _isClick
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonTextWidget(
                                        fontWeight: FontWeight.w500,
                                        textColor: Colors.grey,
                                        text: 'credit_amount'.tr(),
                                      ),
                                      CommonTextWidget(
                                        top: five,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w800,
                                            ),
                                        text:
                                            '$rupee ${_volumeValue.ceil().toString()}',
                                      )
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {});
                                      _isClick = false;
                                      Navigator.of(context).pop();
                                    },
                                    icon: const RotatedBox(
                                      quarterTurns: 1,
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: twenty,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTextWidget(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: eighteen,
                                        ),
                                    text: '${widget.model.name},'
                                        '${'how_much'.tr()}',
                                  ),
                                  CommonTextWidget(
                                    top: five,
                                    fontWeight: FontWeight.w500,
                                    textColor: Colors.grey,
                                    text:
                                        "${'amount_need'.tr()}\n$rupee${widget.model.maxLoan}",
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: widget.size.height * zero007,
                        ),
                        SfRadialGauge(
                            enableLoadingAnimation: true,
                            animationDuration: 4500,
                            axes: <RadialAxis>[
                              RadialAxis(
                                minimum:
                                    double.parse('${widget.model.minLoan}'),
                                maximum:
                                    double.parse('${widget.model.maxLoan}'),
                                showLabels: false,
                                showFirstLabel: false,
                                showTicks: false,
                                radiusFactor: 0.8,
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
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w800),
                                              text:
                                                  '$rupee ${_volumeValue.ceil().toString()}',
                                            ),
                                            CommonTextWidget(
                                              top: five,
                                              fontSize: twelve,
                                              fontWeight: FontWeight.w500,
                                              textColor: Colors.green,
                                              text:
                                                  "@ ${widget.model.interestRate}% ${'monthly'.tr()}",
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                                axisLineStyle: const AxisLineStyle(
                                    cornerStyle: CornerStyle.bothFlat,
                                    color: colorProgress,
                                    thickness: twenty),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    value: _volumeValue,
                                    width: twenty,
                                    animationDuration: 2000,
                                    animationType: AnimationType.slowMiddle,
                                    cornerStyle: CornerStyle.bothCurve,
                                    sizeUnit: GaugeSizeUnit.logicalPixel,
                                    color: colorProgressValue,
                                  ),
                                  MarkerPointer(
                                      value: _volumeValue,
                                      enableDragging: true,
                                      onValueChanged: onVolumeChanged,
                                      markerHeight: fifteen,
                                      markerWidth: fifteen,
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
                          text: 'delivered'.tr(),
                        ),
                      ],
                    ),
                  )
                ],
              ))
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
        onClose: getValue,
        widget: SizedBox(
          height: size.height * 0.8,
          child: EmiSelectionComponent(
            emiAmount: value,
            size: size,
            model: model,
          ),
        ));
  }
}
