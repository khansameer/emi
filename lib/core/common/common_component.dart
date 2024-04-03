import 'package:easy_localization/easy_localization.dart';
import 'package:emi_calculation/core/ModelTheme.dart';
import 'package:emi_calculation/core/app_constants/app_constants.dart';
import 'package:emi_calculation/core/color/color_utils.dart';
import 'package:emi_calculation/core/common/common_button_widget.dart';
import 'package:emi_calculation/core/common/common_text_widget.dart';
import 'package:emi_calculation/core/common/common_textfield.dart';
import 'package:emi_calculation/core/image_path/image_path.dart';
import 'package:emi_calculation/core/string_utils/string_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

commonSetAssetImage(
    {String? image, Color? color, double? width, double? height}) {
  return Image.asset(image ?? icLogo,
      width: width, height: height, color: color ?? colorWhite);
}

changeStatusBarTextColor({SystemUiOverlayStyle? style}) {
  SystemChrome.setSystemUIOverlayStyle(style ?? SystemUiOverlayStyle.dark);
}

AppBar commonAppBar({String? title, List<Widget>? actions, Color? colorText}) {
  return AppBar(
    iconTheme: const IconThemeData(color: colorWhite, size: twenty),
    backgroundColor: colorApp,
    centerTitle: true,
    actions: actions,
    title: CommonTextWidget(
      text: title,
      fontWeight: FontWeight.w500,
      textColor: colorBlue,
    ),
  );
}

Widget commonTextField(
    {String? title,
    String? hint,
    bool? isPassword,
    double? top,
    bool? obscureText,
    TextEditingController? controller,
    Widget? suffixIcon,
    EdgeInsetsGeometry? margin,
    String? Function(String?)? validator}) {
  return Container(
    margin: margin,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          text: title ?? 'email'.tr(),
          top: top,
          textColor: Colors.white,
        ),
        CommonTextField(
          margin: const EdgeInsets.only(top: five),
          borderColor: colorWhite,
          controller: controller,
          validator: validator,
          obscureText: isPassword == true ? obscureText : false,
          suffixIcon: isPassword == true ? suffixIcon : null,
          inputTypes: isPassword == true
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
          hint: hint ?? "example@gmail.com",
        ),
      ],
    ),
  );
}

Widget commonInkWell({
  Widget? child,
  VoidCallback? onTap,
}) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: onTap,
    child: child,
  );
}

Widget commonIcon({IconData? icon, Color? color, double? size}) {
  return Icon(
    icon ?? Icons.visibility,
    color: color ?? colorBlue,
    size: size ?? twenty,
  );
}

Widget commonBgView(
    {required BuildContext context,
    Widget? child,
    Color? color,
    List<Widget>? actions}) {
  var size = MediaQuery.sizeOf(context);
  return Scaffold(
    backgroundColor: colorApp,
    appBar: commonAppBar(actions: actions),
    body: SizedBox(
      width: size.width,

      height: size.height,
      // decoration: const BoxDecoration(
      //     image: DecorationImage(fit: BoxFit.fill, image: AssetImage(icBg))),
      child: child,
    ),
  );
}

TextStyle commonTextStyle(
    {String? fontFamily,
    FontWeight? fontWeight,
    Color? textColor,
    double? fontSize}) {
  return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w500,
      color: textColor ?? Colors.black,
      fontSize: fontSize ?? fourteen,
      fontFamily: fontFamily ?? fontPoppins);
}

showMessageDialog(
    {required BuildContext context,
    String? title,
    String? content,
    Widget? child,
    Color? colorContextText,
    bool isNegative = false,
    String? positiveBtnText,
    VoidCallback? onTapClose,
    String? negativeBtnText}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setstate) {
          return AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(twenty),
            ),
            title: CommonTextWidget(
              text: title.toString(),
              fontSize: sixteen,
              textColor: Colors.green,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
            ),
            content: child ??
                CommonTextWidget(
                  text: content.toString(),
                  textColor: colorLoginBG,
                  textAlign: TextAlign.center,
                ),
            actions: [
              CommonButtonWidget(
                padding: EdgeInsets.all(ten),
                radius: ten,
                onPressed: onTapClose ??
                    () {
                      Navigator.pop(context);
                    },
                text: negativeBtnText ?? 'close'.tr(),
              )
            ],
          );
        });
      });
}

void showModalBottomSheetDialog(
    {required BuildContext context,
    required Size size,
    Widget? widget,
    Color? barrierColor,
    Color? backgroundColor}) {
  showModalBottomSheet<void>(
    context: context,
    elevation: 10,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
    ),
    // backgroundColor: Colors.white,
    barrierColor: Colors.transparent,

    // barrierColor: barrierColor,
    // backgroundColor: backgroundColor,
    //backgroundColor: Colors.transparent,
    clipBehavior: Clip.hardEdge,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return widget ?? Container();
    },
  );
}
