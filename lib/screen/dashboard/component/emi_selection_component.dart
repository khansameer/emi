import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';

class EmiData {
  String? price;
  String? month;
  Color? color;
  bool isSelected = false;

  EmiData({this.price, this.month, this.color, required this.isSelected});
}

class EmiSelectionComponent extends StatefulWidget {
  EmiSelectionComponent({super.key, required this.size, this.onTap});
  Size size;
  VoidCallback? onTap;
  @override
  State<StatefulWidget> createState() {
    return EmiSelectionComponentState();
  }
}

class EmiSelectionComponentState extends State<EmiSelectionComponent> {
  EmiData? selectedValue;
  List<EmiData> projectType = [
    EmiData(
        price: "き 13,361",
        month: "12 months",
        isSelected: true,
        color: Colors.red),
    EmiData(
        price: "ぎ 17,545",
        month: "9 months",
        isSelected: false,
        color: Colors.green),
    EmiData(
        price: "ぎ 25,918/",
        month: "6 months",
        isSelected: false,
        color: Colors.yellow),
    EmiData(
        price: "¥ 51,044/",
        month: "3 months",
        isSelected: false,
        color: Colors.green)
  ];
  @override
  void initState() {
    super.initState();

    selectedValue = projectType.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * zero08,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomSheet: buttonView(),
        body: Column(
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
                    text: 'emi_title'.tr(),
                  ),
                  CommonTextWidget(
                    top: five,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.grey,
                    text: 'emi_desc'.tr(),
                  ),
                  SizedBox(
                    height: widget.size.height * zero0024,
                  ),
                  listview(),
                  CommonButtonWidget(
                    radius: twentyFour,
                    top: widget.size.height * zero0024,
                    width: widget.size.width * zero05,
                    colorButton: Colors.white,
                    colorText: Colors.black,
                    colorBorder: Colors.black,
                    text: 'create_plan'.tr(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buttonView() {
    return commonInkWell(
      onTap: widget.onTap,
      child: Container(
        height: ninety,
        decoration: BoxDecoration(
            color: colorButtons,
            borderRadius: BorderRadius.circular(twentyFive)),
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
          itemCount: projectType.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  for (var element in projectType) {
                    element.isSelected = false;
                  }
                  projectType[index].isSelected = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: (index % 2 == 0) ? Colors.red : Colors.green,
                    borderRadius: BorderRadius.circular(ten)),
                width: widget.size.width * zero04,
                margin: const EdgeInsets.all(ten),
                padding: const EdgeInsets.all(ten),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    viewRadio(item: projectType[index]),
                    const SizedBox(
                      height: fourteen,
                    ),
                    Row(
                      children: [
                        CommonTextWidget(
                          fontWeight: FontWeight.w700,
                          fontSize: sixteen,
                          text: projectType[index].price,
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
                      text: '${'for'.tr()} ${projectType[index].month}',
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
            );
          }),
    );
  }

  viewRadio({required EmiData item}) {
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
