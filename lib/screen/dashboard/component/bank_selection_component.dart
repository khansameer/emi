import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:flutter/material.dart';

class EmiData {
  String? price;
  String? month;
  Color? color;
  bool isSelected = false;

  EmiData({this.price, this.month, this.color, required this.isSelected});
}

class BankSelectionComponent extends StatefulWidget {
  BankSelectionComponent({super.key, required this.size, this.onTap});
  Size size;
  VoidCallback? onTap;
  @override
  State<StatefulWidget> createState() {
    return BankSelectionComponentState();
  }
}

class BankSelectionComponentState extends State<BankSelectionComponent> {
  EmiData? selectedValue;
  List<EmiData> projectType = [
    EmiData(
        price: "HDFC Bank",
        month: "8382273727172",
        isSelected: true,
        color: Colors.red),
    EmiData(
        price: "ICICI Bank",
        month: "6216712727461",
        isSelected: false,
        color: Colors.green),
  ];
  @override
  void initState() {
    super.initState();

    selectedValue = projectType.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        bottomSheet: buttonView(),
        body: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, // BoxShape.circle or BoxShape.retangle
              //color: const Color(0xFF66BB6A),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),
              ]),
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
                      text: 'bank_title'.tr(),
                    ),
                    CommonTextWidget(
                      top: five,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey,
                      text: 'bank_title_desc'.tr(),
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
                      text: 'change_account'.tr(),
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

  listview() {
    return SizedBox(
      width: widget.size.width,
      child: ListView.builder(
          itemCount: projectType.length,
          scrollDirection: Axis.vertical,
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
              child: ListTile(
                trailing: viewRadio(item: projectType[index]),
                leading: Icon(Icons.add_card_outlined),
                title: CommonTextWidget(
                  fontWeight: FontWeight.w600,
                  fontSize: sixteen,
                  textColor: Colors.black,
                  text: projectType[index].price,
                ),
                subtitle: CommonTextWidget(
                  fontSize: sixteen,
                  textColor: Colors.black,
                  text: projectType[index].month,
                ),
              ) /*Container(
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
              )*/
              ,
            );
          }),
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
            text: 'btn_kyc'.tr(),
            fontWeight: FontWeight.w600,
            fontSize: sixteen,
          ),
        ),
      ),
    );
  }

  viewRadio({required EmiData item}) {
    return Container(
      margin: const EdgeInsets.all(ten),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: forty,
            width: forty,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: item.isSelected
                  ? Colors.grey.withOpacity(0.50)
                  : Colors.white,
              border: Border.all(
                  width: one,
                  color: item.isSelected ? Colors.white : Colors.white),
            ),
            child: item.isSelected
                ? const Center(
                    child: Icon(
                    Icons.check,
                    color: Colors.black,
                  ))
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
