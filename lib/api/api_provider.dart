import 'dart:convert';
import 'dart:math';
import 'package:emi_calculation/screen/dashboard/model/emi_bean.dart';
import 'package:emi_calculation/screen/dashboard/model/emi_model.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';

class ApiProvider {
  //--------------------------------------Load EMI Data -------------------------//
  Future<EMIModel> loadEmiData() async {
    try {
      String data = await rootBundle.loadString('assets/json/emi.json');

      final jsonResult = jsonDecode(data);

      return EMIModel.fromJson(jsonResult);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return EMIModel.withError("Data not found / Connection issue");
    }
  }

  List<EMIBean> loadEmiMonthList(String volumeValue, EMIModel model) {
    String emiResult = "";
    List<EMIBean> loadList = [];
    double A = 0.0;
    List<int> monthList = model.emiMonths ?? [];
    int P = int.parse(volumeValue);
    double r = double.parse('1.04') / 12 / 100;
    for (int i = 0; i < monthList.length; i++) {
      int n = monthList[i];
      A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));
      emiResult = A.toStringAsFixed(2);
      loadList.add(EMIBean(
          amount: emiResult, month: '${monthList[i]}', isSelected: false));
      if (kDebugMode) {
        print('==================${monthList[i]}');
      }
      if (kDebugMode) {
        print('======_emiResult===${emiResult}');
      }
    }

    return loadList;
  }
}
