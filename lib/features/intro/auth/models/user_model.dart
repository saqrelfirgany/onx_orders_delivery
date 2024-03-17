class UserModel {
  Data? data;
  Result? result;

  UserModel({this.data, this.result});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    result = json['Result'] != null ? new Result.fromJson(json['Result']) : null;
  }
}

class Data {
  String? deliveryName;

  Data({this.deliveryName});

  Data.fromJson(Map<String, dynamic> json) {
    deliveryName = json['DeliveryName'];
  }
}

class Result {
  String? errMsg;
  int? errNo;

  Result({this.errMsg, this.errNo});

  Result.fromJson(Map<String, dynamic> json) {
    errMsg = json['ErrMsg'];
    errNo = json['ErrNo'];
  }
}
