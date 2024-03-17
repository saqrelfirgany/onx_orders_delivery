class FailureModel {
  Result? result;

  FailureModel({this.result});

  FailureModel.fromJson(Map<String, dynamic> json) {
    result = json['Result'] != null ? new Result.fromJson(json['Result']) : null;
  }
}

class Result {
  String? errMsg;
  String? errNo;

  Result({this.errMsg, this.errNo});

  Result.fromJson(Map<String, dynamic> json) {
    errMsg = json['ErrMsg'];
    errNo = json['ErrNo'].toString();
  }
}
