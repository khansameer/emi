import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/screen/dashboard/model/emi_model.dart';
import 'package:flutter/material.dart';

class EmiData {
  String? price;
  String? month;
  Color? color;
  bool isSelected = false;

  EmiData({this.price, this.month, this.color, required this.isSelected});
}

class BankSelectionComponent extends StatefulWidget {
  BankSelectionComponent({
    super.key,
    required this.size,
    required this.model,
    this.onTap,
  });
  Size size;
  EMIModel model;
  VoidCallback? onTap;

  @override
  State<StatefulWidget> createState() {
    return BankSelectionComponentState();
  }
}

class BankSelectionComponentState extends State<BankSelectionComponent> {
  Banks? selectedValue;

  @override
  void initState() {
    super.initState();

    selectedValue = widget.model.banks?.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        bottomSheet: buttonView(),
        body: Card(
          elevation: 10,
          color: Colors.white,
          shadowColor: Colors.grey,
          surfaceTintColor: Colors.white,
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
          itemCount: widget.model.banks?.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                var bank = widget.model.banks ?? [];
                setState(() {
                  for (var element in bank) {
                    element.isSelected = false;
                  }
                  widget.model.banks?[index].isSelected = true;
                });
              },
              child: ListTile(
                trailing: viewRadio(item: widget.model.banks![index]),
                leading: Image.asset('${widget.model.banks?[index].iconPath}'),
                title: CommonTextWidget(
                  fontWeight: FontWeight.w600,
                  fontSize: sixteen,
                  textColor: Colors.black,
                  text: widget.model.banks?[index].name,
                ),
                subtitle: CommonTextWidget(
                  fontSize: sixteen,
                  textColor: Colors.black,
                  text: widget.model.banks?[index].accountNo,
                ),
              ),
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

  viewRadio({required Banks item}) {
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
