class EMIModel {
  String? error;
  String? name;
  int? maxLoan;
  int? recommendedLoan;
  int? minLoan;
  List<int>? emiMonths;
  double? interestRate;
  List<Banks>? banks;
  EMIModel.withError(String errorMessage) {
    error = errorMessage;
  }
  EMIModel(
      {this.name,
      this.maxLoan,
      this.recommendedLoan,
      this.minLoan,
      this.emiMonths,
      this.interestRate,
      this.banks});

  EMIModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    maxLoan = json['maxLoan'];
    recommendedLoan = json['recommendedLoan'];
    minLoan = json['minLoan'];
    emiMonths = json['emiMonths'].cast<int>();
    interestRate = json['interestRate'];
    if (json['banks'] != null) {
      banks = <Banks>[];
      json['banks'].forEach((v) {
        banks!.add(Banks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['maxLoan'] = maxLoan;
    data['recommendedLoan'] = recommendedLoan;
    data['minLoan'] = minLoan;
    data['emiMonths'] = emiMonths;
    data['interestRate'] = interestRate;
    if (banks != null) {
      data['banks'] = banks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banks {
  String? name;
  String? iconPath;
  String? accountNo;
  bool isSelected = false;

  Banks({this.name, this.iconPath, this.accountNo, required this.isSelected});

  Banks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iconPath = json['iconPath'];
    accountNo = json['accountNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['iconPath'] = iconPath;
    data['accountNo'] = accountNo;
    return data;
  }
}
