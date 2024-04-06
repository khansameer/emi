import 'package:easy_localization/easy_localization.dart';

class Validator {
  static String? validateEmail(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '🚩 ${'email_error_msg'.tr()}';
    } else {
      return null;
    }
  }

  static bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{5,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String? fullNameValidate(String fullName) {
    String patttern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = RegExp(patttern);
    if (fullName.isEmpty) {
      return 'empty_name'.tr();
    } else if (!regExp.hasMatch(fullName)) {
      return 'empty_error_name'.tr();
    }
    return null;
  }
}
