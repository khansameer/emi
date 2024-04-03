import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'common_text_widget.dart';

//ignore: must_be_immutable
class CommonButtonWidget extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;
  double? fontSize;
  double? top;
  double? left;
  double? right;
  double? bottom;
  double? radius;
  double? textLeft;

  EdgeInsetsGeometry? padding;
  VoidCallback? onPressed;
  Color? colorButton;
  Color? colorText;
  Color? colorBorder;
  double? borderWidth;
  double? width;
  double? height;
  bool? iconShow;
  Widget? icon;

  CommonButtonWidget(
      {super.key,
      this.text,
      this.fontWeight,
      this.fontSize,
      this.radius,
      this.top,
      this.onPressed,
      this.colorButton,
      this.left,
      this.right,
      this.bottom,
      this.borderWidth,
      this.colorBorder,
      this.padding,
      this.iconShow,
      this.colorText,
      this.width,
      this.icon,
      this.textLeft,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(
          top: top ?? zero,
          left: left ?? zero,
          bottom: bottom ?? zero,
          right: right ?? zero),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: colorButton ?? colorButtons,
          padding: padding ?? const EdgeInsets.all(fifteen),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: borderWidth ?? zero,
                color: colorBorder ?? Colors.transparent),
            borderRadius: BorderRadius.circular(radius ?? eight),
          ),
          backgroundColor: colorButton ?? colorButtons, // Background Color
        ),
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconShow ?? false
                  ? icon ??
                      Container(
                          margin: const EdgeInsets.only(right: ten),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ))
                  : const SizedBox.shrink(),
              CommonTextWidget(
                  text: text,
                  left: textLeft,
                  textColor: colorText ?? Colors.white,
                  fontWeight: fontWeight ?? FontWeight.w600,
                  fontSize: fontSize ?? fourteen),
            ],
          ),
        ),
      ),
    );
  }
}
