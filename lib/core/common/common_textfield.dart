import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/string_utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//ignore: must_be_immutable
class CommonTextField extends StatelessWidget {
  String? hint;
  FontWeight? fontWeight;
  double? fontSize;
  double? top;
  Widget? iconWidget;
  double? radius;
  TextInputType? inputTypes;
  Widget? suffixIcon;
  ValueChanged? onChange;
  bool? obscureText;
  Color? colorFill;
  Color? colorText;
  Color? colorHint;
  Color? borderColor;
  double? left;
  double? right;
  double? width;
  double? height;
  double? borderWidth;
  double? padding;
  TextEditingController? controller;
  TextInputAction? textInputAction;
  TextCapitalization? textCapitalization;
  bool? isReadOnly;
  EdgeInsetsGeometry? contentPadding;
  List<TextInputFormatter>? inputFormatters;
  bool? isDense;
  int? maxLines;
  int? textInputLength;
  String? errorMessage;
  bool isError = false;
  bool? autofocus = false;
  bool? isHideBorder = false;
  bool? isFill = false;
  String? fontFamily;
  VoidCallback? onTap;
  Color? colorBg;
  EdgeInsetsGeometry? margin;
  String? Function(String?)? validator;
  CommonTextField(
      {super.key,
      this.hint,
      this.fontWeight,
      this.fontSize,
      this.iconWidget,
      this.radius,
      this.inputTypes,
      this.suffixIcon,
      this.onChange,
      this.top,
      this.obscureText,
      this.controller,
      this.colorFill,
      this.colorText,
      this.left,
      this.right,
      this.isDense,
      this.colorHint,
      this.maxLines,
      this.textCapitalization,
      this.inputFormatters,
      this.isReadOnly,
      this.textInputLength,
      this.errorMessage,
      this.isError = false,
      this.onTap,
      this.colorBg,
      this.validator,
      this.isFill,
      this.autofocus,
      this.borderWidth,
      this.borderColor,
      this.textInputAction,
      this.contentPadding,
      this.width,
      this.height,
      this.fontFamily,
      this.isHideBorder,
      this.margin,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? zero),
      width: width ?? MediaQuery.sizeOf(context).width,
      height: height,
      margin: margin ?? const EdgeInsets.only(left: zero, right: zero),
      child: TextFormField(
        validator: validator,
        cursorColor: colorBlue,
        readOnly: isReadOnly ?? false,
        maxLines: maxLines ?? 1,
        inputFormatters: inputFormatters ??
            [
              LengthLimitingTextInputFormatter(textInputLength),
            ],
        controller: controller,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        onChanged: onChange,
        autofocus: autofocus ?? false,
        keyboardType: inputTypes,
        autocorrect: false,
        onTap: onTap,
        obscureText: obscureText ?? false,
        textInputAction: textInputAction ?? TextInputAction.next,
        style: TextStyle(
          fontFamily: fontFamily ?? fontPoppins,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: colorText ?? colorBlue,
          fontSize: fontSize ?? fourteen,
        ),
        decoration: InputDecoration(
            prefixIcon: iconWidget,
            contentPadding: contentPadding ??
                const EdgeInsets.only(
                    left: fifteen,
                    right: fifteen,
                    top: thirteen,
                    bottom: twelve),
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(
              fontWeight: fontWeight ?? FontWeight.w400,
              color: Colors.grey.withOpacity(zero080),
              fontFamily: fontFamily ?? fontPoppins,
              fontSize: fontSize ?? fourteen,
            ),
            filled: isFill ?? true,
            isCollapsed: false,
            isDense: isDense ?? false,
            hintText: hint,
            fillColor: colorFill ?? colorBody,
            border: OutlineInputBorder(
                gapPadding: ten,
                borderSide: BorderSide(
                  color: borderColor ?? colorBody,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(radius ?? eight))),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius:
                    BorderRadius.all(Radius.circular(radius ?? eight))),
            focusedBorder: OutlineInputBorder(
                gapPadding: ten,
                borderSide: BorderSide(
                  color: borderColor ?? colorBody,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(radius ?? eight)))),
      ),
    );
  }
}
