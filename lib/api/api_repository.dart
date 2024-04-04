import 'package:emi_calculation/screen/dashboard/model/emi_bean.dart';
import 'package:emi_calculation/screen/dashboard/model/emi_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<EMIModel> fetchEMIData() {
    return _provider.loadEmiData();
  }

  List<EMIBean> fetchEMIMonthList(String volumeValue, EMIModel model) {
    return _provider.loadEmiMonthList(volumeValue, model);
  }
}

class NetworkError extends Error {}
