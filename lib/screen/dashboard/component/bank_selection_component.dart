import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/core/common/common_component.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/screen/dashboard/model/emi_model.dart';
import 'package:flutter/material.dart';

import 'kyc_component.dart';

//ignore: must_be_immutable
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

  bool _isClick = false;
  String? bankName;
  String? bankIcon;
  String? accountNo;

  @override
  void initState() {
    super.initState();
    widget.model.banks?[0].isSelected = true;
    bankName = widget.model.banks?[0].name;
    bankIcon = widget.model.banks?[0].iconPath;
    accountNo = widget.model.banks?[0].accountNo;

    selectedValue = widget.model.banks?.first;
  }

  getValue(value) {
    setState(() {
      _isClick = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        bottomSheet: buttonView(size: widget.size),
        body: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _isClick
                      ? ListTile(
                          contentPadding:
                              EdgeInsets.only(right: ten, left: ten),
                          title: CommonTextWidget(
                            fontWeight: FontWeight.w500,
                            textColor: Colors.grey,
                            text: bankName,
                          ),
                          leading: Image.asset('$bankIcon'),
                          trailing: IconButton(
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
                          ),
                          subtitle: CommonTextWidget(
                            top: five,
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: eighteen,
                                  fontWeight: FontWeight.w600,
                                ),
                            fontWeight: FontWeight.w800,
                            textColor: Colors.black,
                            text: accountNo,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: eighteen,
                                      fontWeight: FontWeight.w600,
                                    ),
                                text: 'bank_title'.tr(),
                              ),
                              CommonTextWidget(
                                top: five,
                                fontWeight: FontWeight.w500,
                                textColor: Colors.grey,
                                text: 'bank_title_desc'.tr(),
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
                    top: widget.size.height * zero0024,
                    width: widget.size.width * zero05,
                    colorButton: Colors.white,
                    colorText: Colors.black,
                    colorBorder: Colors.black,
                    text: 'change_account'.tr(),
                  )
                ],
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
                  bankIcon = widget.model.banks?[index].iconPath;
                  accountNo = widget.model.banks?[index].accountNo;
                  bankName = widget.model.banks?[index].name;
                });
              },
              child: ListTile(
                trailing: viewRadio(item: widget.model.banks![index]),
                leading: Image.asset('${widget.model.banks?[index].iconPath}'),
                title: CommonTextWidget(
                  fontWeight: FontWeight.w600,
                  fontSize: sixteen,
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: fourteen),
                  textColor: Colors.black,
                  text: widget.model.banks?[index].name,
                ),
                subtitle: CommonTextWidget(
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: twelve),
                  text: widget.model.banks?[index].accountNo,
                ),
              ),
            );
          }),
    );
  }

  buttonView({required Size size}) {
    return commonInkWell(
      onTap: () {
        setState(() {
          _isClick = true;
        });
        showModalBottomSheetDialog(
            context: context,
            size: size,
            onClose: getValue,
            widget: SizedBox(
              width: size.width,
              height: size.height * 0.6,
              child: KycComponent(
                size: size,
                function: getValue,
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
