import 'dart:math';

import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/screen/dashboard/component/bank_selection_component.dart';
import 'package:emi_calculation/screen/dashboard/component/kyc_component.dart';
import 'package:emi_calculation/screen/dashboard/model/emi_bean.dart';
import 'package:emi_calculation/screen/dashboard/model/emi_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:flutter/widgets.dart';

class EmiSelectionComponent extends StatefulWidget {
  EmiSelectionComponent({
    super.key,
    required this.size,
    this.onTap,
    required this.emiAmount,
    required this.model,
  });
  Size size;
  VoidCallback? onTap;

  EMIModel model;
  String emiAmount;
  @override
  State<StatefulWidget> createState() {
    return EmiSelectionComponentState();
  }
}

class EmiSelectionComponentState extends State<EmiSelectionComponent> {
  EMIBean? selectedValue;

  bool _isClick = false;
  String? amount;
  String? month;
  List<EMIBean> loadEMIList = [];
  getValue(value) {
    setState(() {
      _isClick = false;
    });
  }

  void _handleCalculation(String volumeValue, EMIModel model) {
    String emiResult = "";

    double A = 0.0;
    List<int> monthList = model.emiMonths ?? [];
    int P = int.parse(volumeValue);
    double r = double.parse('1.04') / 12 / 100;
    for (int i = 0; i < monthList.length; i++) {
      int n = monthList[i];
      A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));
      emiResult = A.toStringAsFixed(2);
      loadEMIList.add(EMIBean(
          amount: emiResult, month: '${monthList[i]}', isSelected: false));
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _handleCalculation(widget.emiAmount, widget.model);
    selectedValue = loadEMIList.first;
    loadEMIList[0].isSelected = true;
    amount = loadEMIList[0].amount;
    month = loadEMIList[0].month;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * zero08,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomSheet: buttonView(size: widget.size, model: widget.model),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _isClick
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextWidget(
                                  fontWeight: FontWeight.w500,
                                  textColor: Colors.grey,
                                  text: 'emi'.tr(),
                                ),
                                CommonTextWidget(
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.black,
                                  fontSize: 16,
                                  text:
                                      '${double.parse(amount.toString()).round()}',
                                )
                              ],
                            ),
                            Column(
                              children: [
                                CommonTextWidget(
                                  fontWeight: FontWeight.w500,
                                  textColor: Colors.grey,
                                  text: 'duration'.tr(),
                                ),
                                CommonTextWidget(
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.black,
                                  text: '$month Month',
                                )
                              ],
                            ),
                            Row(
                              children: [
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
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextWidget(
                              textColor: Colors.black,
                              fontSize: eighteen,
                              fontWeight: FontWeight.w600,
                              text: 'emi_title'.tr(),
                            ),
                            CommonTextWidget(
                              top: five,
                              fontWeight: FontWeight.w500,
                              textColor: Colors.grey,
                              text: 'emi_desc'.tr(),
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: widget.size.height * zero0024,
                ),
                listview(),
                CommonButtonWidget(
                  radius: twentyFour,
                  left: ten,
                  top: widget.size.height * zero0024,
                  width: widget.size.width * zero05,
                  colorButton: Colors.white,
                  colorText: Colors.black,
                  colorBorder: Colors.black,
                  text: 'create_plan'.tr(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  buttonView({required Size size, required EMIModel model}) {
    return commonInkWell(
      onTap: () {
        setState(() {});
        _isClick = true;

        showModalBottomSheetDialog(
            context: context,
            size: size,
            onClose: getValue,
            widget: SizedBox(
              height: size.height * 0.7,
              child: BankSelectionComponent(
                size: size,
                model: model,
                onTap: () {},
              ),
            ));
      },
      child: Container(
        height: ninety,
        decoration: const BoxDecoration(
            color: colorButtons,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Center(
          child: CommonTextWidget(
            text: 'select_bank'.tr(),
            fontWeight: FontWeight.w600,
            fontSize: sixteen,
          ),
        ),
      ),
    );
  }

  listview() {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height * zero024,
      child: ListView.builder(
          itemCount: loadEMIList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  for (var element in loadEMIList) {
                    element.isSelected = false;
                  }
                  loadEMIList[index].isSelected = true;
                  setState(() {});
                  amount = '${loadEMIList[index].amount}';
                  month = '${loadEMIList[index].month}';
                });
              },
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: index == 0
                            ? Colors.green
                            : index == 1
                                ? Colors.blue
                                : index == 2
                                    ? Colors.orange
                                    : index == 3
                                        ? Colors.pinkAccent
                                        : Colors.green,
                        borderRadius: BorderRadius.circular(ten)),
                    width: widget.size.width * zero04,
                    margin: const EdgeInsets.all(ten),
                    padding: const EdgeInsets.all(ten),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: fourteen,
                        ),
                        viewRadio(item: loadEMIList[index]),
                        const SizedBox(
                          height: fourteen,
                        ),
                        Row(
                          children: [
                            CommonTextWidget(
                              fontWeight: FontWeight.w700,
                              fontSize: sixteen,
                              text:
                                  '${double.parse(loadEMIList[index].amount.toString()).round()}',
                            ),
                            CommonTextWidget(
                              fontWeight: FontWeight.w700,
                              fontSize: sixteen,
                              text: 'mo'.tr(),
                            ),
                          ],
                        ),
                        CommonTextWidget(
                          fontWeight: FontWeight.w600,
                          text:
                              '${'for'.tr()} ${loadEMIList[index].month} ${'month'.tr()}',
                        ),
                        CommonTextWidget(
                          top: twenty,
                          fontWeight: FontWeight.w600,
                          text: 'see_calculations'.tr(),
                          decorationThickness: two,
                          decorationStyle: TextDecorationStyle.dashed,
                          decorationColor: Colors.transparent,
                          textDecoration: TextDecoration.underline,
                        ),
                      ],
                    ),
                  ),
                  index == 0
                      ? Positioned(
                          right: 8,
                          top: 0,
                          left: 8,
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: colorApp,
                                borderRadius: BorderRadius.circular(10)),
                            width: widget.size.width * zero04,
                            alignment: Alignment.center,
                            child: Center(
                              child: CommonTextWidget(
                                text: 'recommended'.tr(),
                              ),
                            ),
                          ))
                      : const SizedBox.shrink(),
                ],
              ),
            );
          }),
    );
  }

  viewRadio({required EMIBean item}) {
    return Container(
      margin: const EdgeInsets.all(ten),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: thirty,
            width: thirty,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: one,
                  color: item.isSelected ? Colors.white : Colors.white),
            ),
            child: item.isSelected
                ? const Center(
                    child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ))
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
