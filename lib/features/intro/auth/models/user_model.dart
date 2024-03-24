class UserModel {
  Data? data;
  Result? result;

  UserModel({this.data, this.result});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    result = json['Result'] != null ? new Result.fromJson(json['Result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    if (this.result != null) {
      data['Result'] = this.result!.toJson();
    }
    return data;
  }
}

class Data {
  String? deliveryName;

  Data({this.deliveryName});

  Data.fromJson(Map<String, dynamic> json) {
    deliveryName = json['DeliveryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DeliveryName'] = this.deliveryName;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrMsg'] = this.errMsg;
    data['ErrNo'] = this.errNo;
    return data;
  }
}
